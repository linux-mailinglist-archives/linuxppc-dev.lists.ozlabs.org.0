Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC948BAFF0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 17:34:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=j7GX9NRd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWFGH5fpWz3dKC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=j7GX9NRd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWFFY0FY6z3cnT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 01:33:37 +1000 (AEST)
Received: from smtpclient.apple (d66-183-91-182.bchsia.telus.net [66.183.91.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6B6D420B2C80;
	Fri,  3 May 2024 08:33:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B6D420B2C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1714750385;
	bh=u83roOV6ApUdhHCZFPvPha+Yc7iFIOLJNXHoxhkiXF4=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=j7GX9NRdjJ0f1JXprYqP4mU6AOIdq5ljmyVYLDipoLA2YOir4KFl5vXntDGJZySEO
	 +i6qqAmEEQ6LcXBnrtvruAXjmxQTA5e8JAMjqBOUmB46Z27e18e+wlNX8l+AN1Plu1
	 xMs1Pj7h/O/y+V8LcuGoEpVLUmg98XLoU24jOVMg=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] [RFC] scsi: Convert from tasklet to BH workqueue
From: Allen Pais <apais@linux.microsoft.com>
In-Reply-To: <87ikzv3b4n.fsf@mail.lhotse>
Date: Fri, 3 May 2024 08:32:54 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA5F645E-7DC6-4737-BCB2-6CD8E2C4471A@linux.microsoft.com>
References: <20240502203433.15811-1-apais@linux.microsoft.com>
 <20240502203433.15811-2-apais@linux.microsoft.com>
 <87ikzv3b4n.fsf@mail.lhotse>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
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
Cc: tyreld@linux.ibm.com, hare@suse.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, npiggin@gmail.com, kashyap.desai@broadcom.com, aneesh.kumar@kernel.org, sumit.saxena@broadcom.com, chandrakanth.patil@broadcom.com, target-devel@vger.kernel.org, artur.paszkiewicz@intel.co, naveen.n.rao@linux.ibm.com, jinpu.wang@cloud.ionos.com, linuxppc-dev@lists.ozlabs.org, megaraidlinux.pdl@broadcom.com, linuxdrivers@attotech.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On May 2, 2024, at 7:03=E2=80=AFPM, Michael Ellerman =
<mpe@ellerman.id.au> wrote:
>=20
> Allen Pais <apais@linux.microsoft.com> writes:
>> The only generic interface to execute asynchronously in the BH =
context is
>> tasklet; however, it's marked deprecated and has some design flaws. =
To
>> replace tasklets, BH workqueue support was recently added. A BH =
workqueue
>> behaves similarly to regular workqueues except that the queued work =
items
>> are executed in the BH context.
>>=20
>> This patch converts drivers/scsi/* from tasklet to BH workqueue.
>>=20
>> Based on the work done by Tejun Heo <tj@kernel.org>
>> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git =
for-6.10
>>=20
>> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
>> ---
>> drivers/scsi/aic7xxx/aic7xxx_osm.c          |  2 +-
>> drivers/scsi/aic94xx/aic94xx_hwi.c          | 14 ++--
>> drivers/scsi/aic94xx/aic94xx_hwi.h          |  5 +-
>> drivers/scsi/aic94xx/aic94xx_scb.c          | 36 +++++-----
>> drivers/scsi/aic94xx/aic94xx_task.c         | 14 ++--
>> drivers/scsi/aic94xx/aic94xx_tmf.c          | 34 ++++-----
>> drivers/scsi/esas2r/esas2r.h                | 12 ++--
>> drivers/scsi/esas2r/esas2r_init.c           | 14 ++--
>> drivers/scsi/esas2r/esas2r_int.c            | 18 ++---
>> drivers/scsi/esas2r/esas2r_io.c             |  2 +-
>> drivers/scsi/esas2r/esas2r_main.c           | 16 ++---
>> drivers/scsi/ibmvscsi/ibmvfc.c              | 16 ++---
>> drivers/scsi/ibmvscsi/ibmvfc.h              |  3 +-
>> drivers/scsi/ibmvscsi/ibmvscsi.c            | 16 ++---
>> drivers/scsi/ibmvscsi/ibmvscsi.h            |  3 +-
>> drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c    | 15 ++--
>> drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h    |  3 +-
>=20
> Something there is giving me a build failure =
(ppc64le_guest_defconfig):
>=20
>  + make -s 'CC=3Dccache powerpc64le-linux-gnu-gcc' -j 4
>  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c: In function =
'ibmvscsi_init_crq_queue':
>  Error: /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:370:331: error: =
'ibmvscsi_work' undeclared (first use in this function)
>  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:370:331: note: each =
undeclared identifier is reported only once for each function it appears =
in
>  /linux/scripts/Makefile.build:244: recipe for target =
'drivers/scsi/ibmvscsi/ibmvscsi.o' failed
>  /linux/scripts/Makefile.build:485: recipe for target =
'drivers/scsi/ibmvscsi' failed
>  /linux/scripts/Makefile.build:485: recipe for target 'drivers/scsi' =
failed
>  /linux/scripts/Makefile.build:485: recipe for target 'drivers' failed
>  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c: In function =
'ibmvscsi_probe':
>  Error: /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:2255:78: error: =
passing argument 1 of 'kthread_create_on_node' from incompatible pointer =
type [-Werror=3Dincompatible-pointer-types]
>  In file included from /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:56:0:
>  /linux/include/linux/kthread.h:11:21: note: expected 'int (*)(void =
*)' but argument is of type 'int (*)(struct work_struct *)'
>   struct task_struct *kthread_create_on_node(int (*threadfn)(void =
*data),
>                       ^
>  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c: At top level:
>  Warning: /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:212:13: warning: =
'ibmvscsi_task' defined but not used [-Wunused-function]
>   static void ibmvscsi_task(void *data)
>               ^
>  Warning: cc1: warning: unrecognized command line option =
'-Wno-shift-negative-value'
>  Warning: cc1: warning: unrecognized command line option =
'-Wno-stringop-overflow'
>  cc1: some warnings being treated as errors
>  make[6]: *** [drivers/scsi/ibmvscsi/ibmvscsi.o] Error 1
>  make[5]: *** [drivers/scsi/ibmvscsi] Error 2
>  make[4]: *** [drivers/scsi] Error 2
>  make[3]: *** [drivers] Error 2
>  make[3]: *** Waiting for unfinished jobs....
>=20
> Full log here: =
https://github.com/linuxppc/linux-snowpatch/actions/runs/8930174372/job/24=
529645923

 Thank you for testing it out. Unfortunately, I did not cross-compile =
it.
Will fix this in v2.

- Allen

>=20
> Cross compile instructions if you're keen: =
https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels
>=20
> cheers

