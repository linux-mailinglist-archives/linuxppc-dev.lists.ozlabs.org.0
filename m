Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99C891833
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 12:54:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=r/rSvynl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5f3J3wdPz3vbk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 22:54:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=r/rSvynl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wetzel-home.de (client-ip=2a03:4000:40:5b2::1; helo=ns2.wdyn.eu; envelope-from=alexander@wetzel-home.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 493 seconds by postgrey-1.37 at boromir; Fri, 29 Mar 2024 22:19:09 AEDT
Received: from ns2.wdyn.eu (ns2.wdyn.eu [IPv6:2a03:4000:40:5b2::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5dG56ymGz3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 22:19:09 +1100 (AEDT)
From: Alexander Wetzel <Alexander@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1711710643;
	bh=ZrviXutq2dr435AUYJjbLGSGv3c9p2DlZU+PRLOghiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=r/rSvynlz3W8TbpsIKNUWqG4mk9PVFbFdnEkeP9XdK9sUhhDuoKu4mgZI1Ehzjd0f
	 6fQqfxAzQcDAGh+z8nm9/E2+WF6pbbvYzGCXFN6TNl+txRZyzELTkJsZxjhOaBvu83
	 r4KbgLQ9PbwF+cPSXGnq22j2XNy2zRnnGaUWRJnc=
To: sachinp@linux.ibm.com
Subject: Re: [powerpc] WARN at drivers/scsi/sg.c:2236 (sg_remove_sfp_usercontext)
Date: Fri, 29 Mar 2024 12:10:25 +0100
Message-ID: <20240329111025.9486-1-Alexander@wetzel-home.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com>
References: <5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Mar 2024 22:54:17 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Alexander@wetzel-home.de, bvanassche@acm.org, linux-scsi@vger.kernel.org, martin.petersen@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Following WARN_ON_ONCE is triggered while running LTP tests
> (specifically ioctl_sg01) on IBM Power booted with 6.9.0-rc1-next-20240328
>
> [   64.230233] ------------[ cut here ]------------
> [   64.230269] WARNING: CPU: 10 PID: 452 at drivers/scsi/sg.c:2236 sg_remove_sfp_usercontext+0x270/0x280 [sg]
> [   64.230302] Modules linked in: rpadlpar_io rpaphp xsk_diag nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding tls rfkill ip_set nf_tables nfnetlink sunrpc binfmt_misc pseries_rng vmx_crypto xfs libcrc32c sd_mod sr_mod t10_pi crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp fuse
> [   64.230420] CPU: 10 PID: 452 Comm: kworker/10:1 Kdump: loaded Not tainted 6.9.0-rc1-next-20240328 #2
> [   64.230438] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_018) hv:phyp pSeries
> [   64.230449] Workqueue: events sg_remove_sfp_usercontext [sg]
> [   64.230468] NIP:  c008000015c34110 LR: c008000015c33ffc CTR: c0000000005393b0
> [   64.230485] REGS: c00000000c1efae0 TRAP: 0700   Not tainted  (6.9.0-rc1-next-20240328)
> [   64.230498] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44000408  XER: 00000000
> [   64.230535] CFAR: c008000015c3400c IRQMASK: 0
> [   64.230535] GPR00: c008000015c33ffc c00000000c1efd80 c008000015c58900 c00000000ca8ae98
> [   64.230535] GPR04: 00000000c0000000 0000000000000023 c000000007c2e000 0000000000000022
> [   64.230535] GPR08: 000000038a130000 0000000000000002 0000000000000000 c008000015c38bc0
> [   64.230535] GPR12: c0000000005393b0 c00000038fff3f00 c0000000001a2bac c000000007c7a9c0
> [   64.230535] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [   64.230535] GPR20: c00000038c3f3b00 c000000007c10030 c000000007c10000 c0000000901c0000
> [   64.230535] GPR24: 0000000000000000 c00000000ca8ae00 c0000000045a5805 c000000007c11330
> [   64.230535] GPR28: c00000038c3f3b00 c000000007c10080 c000000007c11328 c000000002fdee54
> [   64.230671] NIP [c008000015c34110] sg_remove_sfp_usercontext+0x270/0x280 [sg]
> [   64.230690] LR [c008000015c33ffc] sg_remove_sfp_usercontext+0x15c/0x280 [sg]
> [   64.230709] Call Trace:
> [   64.230716] [c00000000c1efd80] [c008000015c33ffc] sg_remove_sfp_usercontext+0x15c/0x280 [sg] (unreliable)
> [   64.230740] [c00000000c1efe40] [c00000000019337c] process_one_work+0x20c/0x4f4
> [   64.230767] [c00000000c1efef0] [c0000000001942fc] worker_thread+0x378/0x544
> [   64.230787] [c00000000c1eff90] [c0000000001a2cdc] kthread+0x138/0x140
> [   64.230801] [c00000000c1effe0] [c00000000000df98] start_kernel_thread+0x14/0x18
> [   64.230819] Code: e8c98310 3d220000 e8698010 480044bd e8410018 7ec3b378 48004ac9 e8410018 38790098 81390098 2c090001 4182ff04 <0fe00000> 4bfffefc 000247e0 00000000
> [   64.230857] ---[ end trace 0000000000000000 ]—
>
> This WARN_ON was introduced with
> commit 27f58c04a8f438078583041468ec60597841284d
>     scsi: sg: Avoid sg device teardown race
>
> Reverting the patch avoids the warning. The test case passes irrespective of the
> patch is present of not.
>

The new WARN_ON_ONCE is only an additional logic check. When it
triggers it also should trigger when you undo the rest of the change.

But when it triggers something with the driver logic must be off.
(Or my understanding of the intent of the code is worse than assumed:-)

Looking into the d_ref logic I see two additional problems not addressed
by the original patch when sg_add_sfp() fails:
 1) sg_open() is then also calling first scsi_device_put() and then
    sg_device_destroy() via kref_put(). That's the wrong order.

 2) When sg_add_sfp() fails we never call kref_get(&sdp->d_ref).
    Thus we shoud not call kref_get() here at all.

Thus your warning above could be triggered by an error within
sg_add_sfp(): In that case d_ref would already be zero when the code
gets to the warning.

Can you check the debug patch below and provide output?
When I'm right the warning should be gone and you should just get the
"Modification triggered" instead. When I'm wrong we should at least see,
how many references d_ref has left.

Alexander
---
 drivers/scsi/sg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index ff6894ce5404..1c27d5f8f384 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -373,7 +373,8 @@ sg_open(struct inode *inode, struct file *filp)
 	scsi_autopm_put_device(sdp->device);
 sdp_put:
 	scsi_device_put(sdp->device);
-	goto sg_put;
+	pr_warn("%s: Modification triggered\n", __func__);
+	return retval;
 }
 
 /* Release resources associated with a successful sg_open()
@@ -2233,7 +2234,8 @@ sg_remove_sfp_usercontext(struct work_struct *work)
 			"sg_remove_sfp: sfp=0x%p\n", sfp));
 	kfree(sfp);
 
-	WARN_ON_ONCE(kref_read(&sdp->d_ref) != 1);
+	if(WARN_ON_ONCE(kref_read(&sdp->d_ref) != 1))
+		printk(KERN_WARNING "d_ref=%u\n", kref_read(&sdp->d_ref));
 	kref_put(&sdp->d_ref, sg_device_destroy);
 	scsi_device_put(device);
 	module_put(THIS_MODULE);
-- 
2.44.0

