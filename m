Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E85310C31
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 14:51:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXH0D2dhGzDwhc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 00:51:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qG+OKPYr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXGxk6zhgzDwhY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 00:49:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115DZWqP189917; Fri, 5 Feb 2021 08:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Ss+xpeNe6Ai9mYybJahU9kqkWCjpwz8PKUDwYLgYo3E=;
 b=qG+OKPYrldemS9hdD9tdDWBH0VOLnizUoCrCVOn4elMoA9p/nwh6GolXJK67nM7MRzq4
 8qTPK1o78GdkXJSOW2mWKt4r8WD0nB3wqgjwUg2ghP3EaeOEcKjgzxo0o9aJC1kiaEqd
 1q05WaTpHEnNphVHQIiHgboHOdc1qqUY4KYYdKaR9jJsD0fgk4EfuKBhDBu5gWd4yKEC
 vnodW7CsrI2Ka8nprbqdw+Kpw7DI7Gh+bfRk+6nHXavKi6N23qCxeh+UqEeUGi020WC5
 wRW1Qxx6qc6jLfE0O9oc1A4Jtt+NI1tc+QK+pgsqhyqXHU1PcF7/gp4nO7NYxTPzQjC6 Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36h6999s46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 08:49:42 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 115Dgvd6028825;
 Fri, 5 Feb 2021 08:49:42 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36h6999s3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 08:49:42 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115DmWIB006646;
 Fri, 5 Feb 2021 13:49:41 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 36ex3pjgcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:49:41 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115DnfP78323676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 13:49:41 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECDA6B2065;
 Fri,  5 Feb 2021 13:49:40 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 328EFB205F;
 Fri,  5 Feb 2021 13:49:39 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.1.215])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 13:49:38 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Zorro Lang <zlang@redhat.com>
Subject: Re: [PATCH] powerpc/kuap: Allow kernel thread to access userspace
 after kthread_use_mm
In-Reply-To: <20210205095820.GI14354@localhost.localdomain>
References: <20210205030426.430331-1-aneesh.kumar@linux.ibm.com>
 <20210205095820.GI14354@localhost.localdomain>
Date: Fri, 05 Feb 2021 19:19:36 +0530
Message-ID: <871rdur5e7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050088
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zorro Lang <zlang@redhat.com> writes:

....

> ...
> [  530.180466] run fstests generic/617 at 2021-02-05 03:41:10
> [  530.707969] ------------[ cut here ]------------
> [  530.708006] kernel BUG at arch/powerpc/include/asm/book3s/64/kup.h:207!
> [  530.708013] Oops: Exception in kernel mode, sig: 5 [#1]
> [  530.708018] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [  530.708022] Modules linked in: bonding rfkill sunrpc uio_pdrv_genirq pseries_rng uio drm fuse drm_panel_orientation_quirks ip_tables xfs libcrc32c sd_mod t10_pi ibmvscsi ibmveth scsi_trans
> port_srp xts vmx_crypto
> [  530.708049] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Not tainted 5.11.0-r

ok so we call current_thread_amr() with kthread.

commit ae33fb7b069ebb41e32f55ae397c887031e47472
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Fri Feb 5 19:11:49 2021 +0530

    
    The other stack that matters is
    ...
    [  530.710838] CPU: 13 PID: 5587 Comm: io_wqe_worker-0 Tainted: G      D           5.11.0-rc6+ #3
    ....
    
     NIP [c0000000000aa0c8] pkey_access_permitted+0x28/0x90
     LR [c0000000004b9278] gup_pte_range+0x188/0x420
     --- interrupt: 700
     [c00000001c4ef3f0] [0000000000000000] 0x0 (unreliable)
     [c00000001c4ef490] [c0000000004bd39c] gup_pgd_range+0x3ac/0xa20
     [c00000001c4ef5a0] [c0000000004bdd44] internal_get_user_pages_fast+0x334/0x410
     [c00000001c4ef620] [c000000000852028] iov_iter_get_pages+0xf8/0x5c0
     [c00000001c4ef6a0] [c0000000007da44c] bio_iov_iter_get_pages+0xec/0x700
     [c00000001c4ef770] [c0000000006a325c] iomap_dio_bio_actor+0x2ac/0x4f0
     [c00000001c4ef810] [c00000000069cd94] iomap_apply+0x2b4/0x740
     [c00000001c4ef920] [c0000000006a38b8] __iomap_dio_rw+0x238/0x5c0
     [c00000001c4ef9d0] [c0000000006a3c60] iomap_dio_rw+0x20/0x80
     [c00000001c4ef9f0] [c008000001927a30] xfs_file_dio_aio_write+0x1f8/0x650 [xfs]
     [c00000001c4efa60] [c0080000019284dc] xfs_file_write_iter+0xc4/0x130 [xfs]
     [c00000001c4efa90] [c000000000669984] io_write+0x104/0x4b0
     [c00000001c4efbb0] [c00000000066cea4] io_issue_sqe+0x3d4/0xf50
     [c00000001c4efc60] [c000000000670200] io_wq_submit_work+0xb0/0x2f0
     [c00000001c4efcb0] [c000000000674268] io_worker_handle_work+0x248/0x4a0
     [c00000001c4efd30] [c0000000006746e8] io_wqe_worker+0x228/0x2a0
     [c00000001c4efda0] [c00000000019d994] kthread+0x1b4/0x1c0

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 2064621ae7b6..21e59c1f0d67 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -204,14 +204,16 @@ DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 
 static inline u64 current_thread_amr(void)
 {
-	VM_BUG_ON(!current->thread.regs);
-	return current->thread.regs->amr;
+	if (current->thread.regs)
+		return current->thread.regs->amr;
+	return 0;
 }
 
 static inline u64 current_thread_iamr(void)
 {
-	VM_BUG_ON(!current->thread.regs);
-	return current->thread.regs->iamr;
+	if (current->thread.regs)
+		return current->thread.regs->iamr;
+	return 0;
 }
 #endif /* CONFIG_PPC_PKEY */
 
