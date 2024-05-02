Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E68BA19B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 22:35:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=R1Az1bhb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVm0j0D97z3cYv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 06:35:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=R1Az1bhb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVlzy5W0Wz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 06:35:10 +1000 (AEST)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id 74FF9206B4F6;
	Thu,  2 May 2024 13:34:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 74FF9206B4F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714682078;
	bh=+lQIkPk/QRwGLvJaABVHpfk2bsKn+OK5GGtbW+NWBq4=;
	h=From:To:Cc:Subject:Date:From;
	b=R1Az1bhbZ1U2kukMUltUxFXqjNQs5oqcLebOvX2J+TwfYcx8ex6Pa/3lD1SFfvyzF
	 gMPhr48V7XMiAp50rN6k+ip0/k71dY1VVjcNEUNkC1FzobY1A7jEdLnBmFC0t3EHrl
	 3ClkqKrgfg1QAvwKmn1v7IZ3aVQJFD6N2lqMO0zs=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-scsi@vger.kernel.org
Subject: [PATCH 0/1] Convert tasklets to bottom half workqueues
Date: Thu,  2 May 2024 20:34:32 +0000
Message-Id: <20240502203433.15811-1-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: tyreld@linux.ibm.com, hare@suse.com, linuxdrivers@attotech.com, martin.petersen@oracle.com, shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, kashyap.desai@broadcom.com, aneesh.kumar@kernel.org, sumit.saxena@broadcom.com, chandrakanth.patil@broadcom.com, target-devel@vger.kernel.org, artur.paszkiewicz@intel.co, naveen.n.rao@linux.ibm.com, jinpu.wang@cloud.ionos.com, linuxppc-dev@lists.ozlabs.org, megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I am submitting this patch which converts instances of tasklets
in drivers/scsi/* to bottom half workqueues. I appreciate your
feedback and suggestion on the changes.

Note: The patch is only compile tested.

In the patcheset, you will notice *FIXME* in two places:
1. pm8001/pm8001_init.c @ pm8001_work(struct work_struct *t)
2. pmcraid.c @ pmcraid_work_function(struct work_struct *t)

The current implementation limits context-aware processing
within work functions due to the lack of a mechanism to identify
the source work_struct in the array. The proposed solution wraps
each work_struct with a struct work_wrapper, adding crucial context
like the array index and a reference to the parent data structure.

Ex:

#define SOME_CONSTANT 10
struct xxx_data {

.....
struct work_struct work[SOME_CONSTANT]:
.....
};

The xxx_data module currently uses an array of work_structs
for scheduling work, but it lacks the ability to identify which
array element is associated with a specific invocation of the work
function. This limitation prevents the execution of context-specific
actions based on the source of the work request.

The proposed solution is to introduce a struct work_wrapper that
encapsulates each work_struct along with additional metadata,
including an index and a pointer to the parent xxx_data structure.
This enhancement allows the work function to access necessary
context information.

Changes:

1. Definition of struct work_wrapper:

struct work_wrapper {
    struct work_struct work;
    struct xxx_data *data;
    int index;
};

struct xxx_data {
    struct work_wrapper work[SOME_CONSTANT];
};

During initialization:

for (int i = 0; i < SOME_CONSTANT; i++) {
    p->work[i].data = p;
    p->work[i].index = i;
    INIT_WORK(&p->work[i].work, work_func);
}

And it's usage in the handler:

void work_func(struct work_struct *t)
{
    struct work_wrapper *wrapper = from_work(wrapper, t, work);
    struct xxx_data *a = wrapper->data;
    int index = wrapper->index;

    ....
}

If the above is solution is acceptable, I can have the same
incorporated in version 2.

Thanks.

Allen Pais (1):
  [RFC] scsi: Convert from tasklet to BH workqueue

 drivers/scsi/aic7xxx/aic7xxx_osm.c          |  2 +-
 drivers/scsi/aic94xx/aic94xx_hwi.c          | 14 ++--
 drivers/scsi/aic94xx/aic94xx_hwi.h          |  5 +-
 drivers/scsi/aic94xx/aic94xx_scb.c          | 36 +++++-----
 drivers/scsi/aic94xx/aic94xx_task.c         | 14 ++--
 drivers/scsi/aic94xx/aic94xx_tmf.c          | 34 +++++-----
 drivers/scsi/esas2r/esas2r.h                | 12 ++--
 drivers/scsi/esas2r/esas2r_init.c           | 14 ++--
 drivers/scsi/esas2r/esas2r_int.c            | 18 ++---
 drivers/scsi/esas2r/esas2r_io.c             |  2 +-
 drivers/scsi/esas2r/esas2r_main.c           | 16 ++---
 drivers/scsi/ibmvscsi/ibmvfc.c              | 16 ++---
 drivers/scsi/ibmvscsi/ibmvfc.h              |  3 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c            | 16 ++---
 drivers/scsi/ibmvscsi/ibmvscsi.h            |  3 +-
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c    | 15 ++---
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h    |  3 +-
 drivers/scsi/isci/host.c                    | 12 ++--
 drivers/scsi/isci/host.h                    |  8 +--
 drivers/scsi/isci/init.c                    |  4 +-
 drivers/scsi/megaraid/mega_common.h         |  5 +-
 drivers/scsi/megaraid/megaraid_mbox.c       | 21 +++---
 drivers/scsi/megaraid/megaraid_sas.h        |  4 +-
 drivers/scsi/megaraid/megaraid_sas_base.c   | 32 +++++----
 drivers/scsi/megaraid/megaraid_sas_fusion.c | 16 ++---
 drivers/scsi/mvsas/mv_init.c                | 27 ++++----
 drivers/scsi/mvsas/mv_sas.h                 |  9 +--
 drivers/scsi/pm8001/pm8001_init.c           | 57 ++++++++--------
 drivers/scsi/pm8001/pm8001_sas.h            |  2 +-
 drivers/scsi/pmcraid.c                      | 75 ++++++++++-----------
 drivers/scsi/pmcraid.h                      |  5 +-
 31 files changed, 249 insertions(+), 251 deletions(-)

-- 
2.17.1

