Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A98BA527
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 04:04:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H5k68sDS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVvHT37lMz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H5k68sDS;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVvGk4d0pz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 12:03:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714701803;
	bh=O2rIImNa5eTX5JMS2gK4B5+p9DQZTIlWwqfyVhLPEjs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H5k68sDSmC2DbJz+33czp8ldQxidcRYZnKOy5boIYRoBRouyDG78TxydSwEUPk+U+
	 r94Agvp8BLRxLOGOxj0MJqqQpKPbOMfZvdphYSpPBx9pRTF+IMCS7niDPzXn7kS2oL
	 dgc4JJf3xI+wurpAbKMqW8pO2nHH8MLpdFB7zfdG5YzGF8c9bkNZf2Gpz6V3477v1W
	 VN5Zb1r8ULqYPNlMJxgWijx4y+2uOSwomPntynB4Wvd1EtESkKyKAnCUWCfbRZSYuE
	 vxFEbobYnEYwZmCzp70+QVJfXaf3SBBXJ4utTr0l5UTHcUr3ceJKDCmXJmLV4BcZkN
	 knTSkRFwnTSDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VVvGc44T2z4wcg;
	Fri,  3 May 2024 12:03:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Allen Pais <apais@linux.microsoft.com>, linux-scsi@vger.kernel.org
Subject: Re: [PATCH] [RFC] scsi: Convert from tasklet to BH workqueue
In-Reply-To: <20240502203433.15811-2-apais@linux.microsoft.com>
References: <20240502203433.15811-1-apais@linux.microsoft.com>
 <20240502203433.15811-2-apais@linux.microsoft.com>
Date: Fri, 03 May 2024 12:03:20 +1000
Message-ID: <87ikzv3b4n.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Allen Pais <apais@linux.microsoft.com> writes:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/scsi/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/scsi/aic7xxx/aic7xxx_osm.c          |  2 +-
>  drivers/scsi/aic94xx/aic94xx_hwi.c          | 14 ++--
>  drivers/scsi/aic94xx/aic94xx_hwi.h          |  5 +-
>  drivers/scsi/aic94xx/aic94xx_scb.c          | 36 +++++-----
>  drivers/scsi/aic94xx/aic94xx_task.c         | 14 ++--
>  drivers/scsi/aic94xx/aic94xx_tmf.c          | 34 ++++-----
>  drivers/scsi/esas2r/esas2r.h                | 12 ++--
>  drivers/scsi/esas2r/esas2r_init.c           | 14 ++--
>  drivers/scsi/esas2r/esas2r_int.c            | 18 ++---
>  drivers/scsi/esas2r/esas2r_io.c             |  2 +-
>  drivers/scsi/esas2r/esas2r_main.c           | 16 ++---
>  drivers/scsi/ibmvscsi/ibmvfc.c              | 16 ++---
>  drivers/scsi/ibmvscsi/ibmvfc.h              |  3 +-
>  drivers/scsi/ibmvscsi/ibmvscsi.c            | 16 ++---
>  drivers/scsi/ibmvscsi/ibmvscsi.h            |  3 +-
>  drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c    | 15 ++--
>  drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.h    |  3 +-

Something there is giving me a build failure (ppc64le_guest_defconfig):

  + make -s 'CC=ccache powerpc64le-linux-gnu-gcc' -j 4
  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_init_crq_queue':
  Error: /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:370:331: error: 'ibmvscsi_work' undeclared (first use in this function)
  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:370:331: note: each undeclared identifier is reported only once for each function it appears in
  /linux/scripts/Makefile.build:244: recipe for target 'drivers/scsi/ibmvscsi/ibmvscsi.o' failed
  /linux/scripts/Makefile.build:485: recipe for target 'drivers/scsi/ibmvscsi' failed
  /linux/scripts/Makefile.build:485: recipe for target 'drivers/scsi' failed
  /linux/scripts/Makefile.build:485: recipe for target 'drivers' failed
  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_probe':
  Error: /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:2255:78: error: passing argument 1 of 'kthread_create_on_node' from incompatible pointer type [-Werror=incompatible-pointer-types]
  In file included from /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:56:0:
  /linux/include/linux/kthread.h:11:21: note: expected 'int (*)(void *)' but argument is of type 'int (*)(struct work_struct *)'
   struct task_struct *kthread_create_on_node(int (*threadfn)(void *data),
                       ^
  /linux/drivers/scsi/ibmvscsi/ibmvscsi.c: At top level:
  Warning: /linux/drivers/scsi/ibmvscsi/ibmvscsi.c:212:13: warning: 'ibmvscsi_task' defined but not used [-Wunused-function]
   static void ibmvscsi_task(void *data)
               ^
  Warning: cc1: warning: unrecognized command line option '-Wno-shift-negative-value'
  Warning: cc1: warning: unrecognized command line option '-Wno-stringop-overflow'
  cc1: some warnings being treated as errors
  make[6]: *** [drivers/scsi/ibmvscsi/ibmvscsi.o] Error 1
  make[5]: *** [drivers/scsi/ibmvscsi] Error 2
  make[4]: *** [drivers/scsi] Error 2
  make[3]: *** [drivers] Error 2
  make[3]: *** Waiting for unfinished jobs....

Full log here: https://github.com/linuxppc/linux-snowpatch/actions/runs/8930174372/job/24529645923

Cross compile instructions if you're keen: https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels

cheers
