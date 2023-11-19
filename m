Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E737C7F04A5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 08:24:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=GKy79ubR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SY2FF61kKz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 18:24:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=dkim3 header.b=GKy79ubR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iram.es (client-ip=143.55.146.78; helo=mx07-006a4e02.pphosted.com; envelope-from=paubert@iram.es; receiver=lists.ozlabs.org)
X-Greylist: delayed 1216 seconds by postgrey-1.37 at boromir; Sun, 19 Nov 2023 18:23:13 AEDT
Received: from mx07-006a4e02.pphosted.com (mx07-006a4e02.pphosted.com [143.55.146.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SY2DK5Z04z3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 18:23:12 +1100 (AEDT)
Received: from pps.filterd (m0316690.ppops.net [127.0.0.1])
	by mx07-006a4e02.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AJ6F3Cf027017;
	Sun, 19 Nov 2023 08:02:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iram.es; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=dkim3; bh=2syj0J85x3HLZtg/JgjyLpKj4
	XbCJajaqbPE+i64SiE=; b=GKy79ubRDKg3H1goL0XayK8JfvTucEo0v613lkhhY
	imxsztTEz4/PdLJqogZ2atY4plLgCu54AFBgzwgV6NsmujQnzq6tkCfU4TqQ2Rh8
	Fm41P7K96HWhVhEo5Tz+hYmXqNjPI75G+Zie97lOEfE1otO4BvxLkhOirJldYxFJ
	QGW6C1FTgccmPp72+onK5HJupBd3KogtFhP1NYF1fbTS4cZO6h+eZ5GdgjzYzFdJ
	odkxQvDSbc5lQWY6ywi5eG8cFm5wTCO3Wmj+7yZepJlhXi7nfoXS/LgGOHts+hJA
	2kETf+0NM8Th2cS+BVj1llZprZx7gBjwACPyRhotPlHBQ==
Received: from mta-out03.sim.rediris.es (mta-out03.sim.rediris.es [130.206.24.45])
	by mx07-006a4e02.pphosted.com (PPS) with ESMTPS id 3uf7gq1xum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Nov 2023 08:02:28 +0100 (CET)
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
	by mta-out03.sim.rediris.es (Postfix) with ESMTPS id 48CC41200C4;
	Sun, 19 Nov 2023 08:02:27 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta-out03.sim.rediris.es (Postfix) with ESMTP id 2C86E1200C7;
	Sun, 19 Nov 2023 08:02:27 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out03.sim.rediris.es
Received: from mta-out03.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out03.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id bD_ShB_V5ozk; Sun, 19 Nov 2023 08:02:27 +0100 (CET)
Received: from gp-workstation.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
	by mta-out03.sim.rediris.es (Postfix) with ESMTPA id 7874D1200C4;
	Sun, 19 Nov 2023 08:02:24 +0100 (CET)
Date: Sun, 19 Nov 2023 08:02:23 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
Message-ID: <20231119070223.GA62996@gp-workstation.iram.es>
References: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1105090647.48374193.1700351103830.JavaMail.zimbra@raptorengineeringinc.com>
X-Proofpoint-ORIG-GUID: sBTR22t3EMl8dOdSIEKalDoAHYW1X_oZ
X-Proofpoint-GUID: sBTR22t3EMl8dOdSIEKalDoAHYW1X_oZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-19_04,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0 mlxscore=0 mlxlogscore=690
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311190050
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
Cc: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 18, 2023 at 05:45:03PM -0600, Timothy Pearson wrote:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.  This leads to userspace register corruption
> and application data corruption / crash under the following rare condition:
> 
>  * A userspace thread is executing with VSX/FP mode enabled
>  * The userspace thread is making active use of fr0 and/or vs0
>  * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
>  * The userspace thread is interrupted by the IPI before accessing data it
>    previously stored in fr0/vs0
>  * The thread being switched in by the IPI has a pending signal
> 
> If these exact criteria are met, then the following sequence happens:
> 
>  * The existing thread FP storage is still valid before the IPI, due to a
>    prior call to save_fpu() or store_fp_state().  Note that the current
>    fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
>    is now invalid pending a call to restore_fp()/restore_altivec().
>  * IPI -- FP/VSX register state remains invalid
>  * interrupt_exit_user_prepare_main() calls do_notify_resume(),
>    due to the pending signal
>  * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
>    merrily reads and saves the invalid FP/VSX state to thread local storage.
>  * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
>    FP/VSX state back to registers.
>  * Execution is released to userspace, and the application crashes or corrupts
>    data.
> 
> Without the pending signal, do_notify_resume() is never called, therefore the
> invalid register state does't matter as it is overwritten nearly immeediately
> by interrupt_exit_user_prepare_main() calling restore_math() before return
> to userspace.
> 
> The combination of MariaDB and io_uring is especially good at triggering data
> corruption using the above sequence, see MariaDB bug MDEV-30728.
> 
> Restore fr0/vs0 after FPSCR/VSCR store has completed for both the fp and
> altivec register save paths.
> 
> Tested under QEMU in kvm mode, running on a Talos II workstation with dual
> POWER9 DD2.2 CPUs.
> 
> Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  arch/powerpc/kernel/fpu.S    | 13 +++++++++++++
>  arch/powerpc/kernel/vector.S |  4 ++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
> index 6a9acfb690c9..2f8f3f93cbb6 100644
> --- a/arch/powerpc/kernel/fpu.S
> +++ b/arch/powerpc/kernel/fpu.S
> @@ -23,6 +23,15 @@
>  #include <asm/feature-fixups.h>
>  
>  #ifdef CONFIG_VSX
> +#define __REST_1FPVSR(n,c,base)						\
> +BEGIN_FTR_SECTION							\
> +	b	2f;							\
> +END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
> +	REST_FPR(n,base);						\
> +	b	3f;							\
> +2:	REST_VSR(n,c,base);						\
> +3:
> +
>  #define __REST_32FPVSRS(n,c,base)					\
>  BEGIN_FTR_SECTION							\
>  	b	2f;							\
> @@ -41,9 +50,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
>  2:	SAVE_32VSRS(n,c,base);						\
>  3:
>  #else
> +#define __REST_1FPVSR(n,b,base)		REST_FPR(n, base)
>  #define __REST_32FPVSRS(n,b,base)	REST_32FPRS(n, base)
>  #define __SAVE_32FPVSRS(n,b,base)	SAVE_32FPRS(n, base)
>  #endif
> +#define REST_1FPVSR(n,c,base)   __REST_1FPVSR(n,__REG_##c,__REG_##base)
>  #define REST_32FPVSRS(n,c,base) __REST_32FPVSRS(n,__REG_##c,__REG_##base)
>  #define SAVE_32FPVSRS(n,c,base) __SAVE_32FPVSRS(n,__REG_##c,__REG_##base)
>  
> @@ -67,6 +78,7 @@ _GLOBAL(store_fp_state)
>  	SAVE_32FPVSRS(0, R4, R3)
>  	mffs	fr0
>  	stfd	fr0,FPSTATE_FPSCR(r3)
> +	REST_1FPVSR(0, R4, R3)
>  	blr
>  EXPORT_SYMBOL(store_fp_state)
>  
> @@ -138,4 +150,5 @@ _GLOBAL(save_fpu)
>  2:	SAVE_32FPVSRS(0, R4, R6)
>  	mffs	fr0
>  	stfd	fr0,FPSTATE_FPSCR(r6)
> +	REST_1FPVSR(0, R4, R6)
>  	blr
> diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
> index 4094e4c4c77a..8c63b05b421e 100644
> --- a/arch/powerpc/kernel/vector.S
> +++ b/arch/powerpc/kernel/vector.S
> @@ -33,6 +33,8 @@ _GLOBAL(store_vr_state)
>  	mfvscr	v0
>  	li	r4, VRSTATE_VSCR
>  	stvx	v0, r4, r3
> +	li	r4, 0
> +	lvx	v0, r4, r3

Just a small nit, no need for clearing r4, "lvx v0,0,r3" will do, as all
Power instructions using indexed addressing mode.

>  	blr
>  EXPORT_SYMBOL(store_vr_state)
>  
> @@ -109,6 +111,8 @@ _GLOBAL(save_altivec)
>  	mfvscr	v0
>  	li	r4,VRSTATE_VSCR
>  	stvx	v0,r4,r7
> +	li	r4,0
> +	lvx	v0,r4,r7

Ditto.

And great bug hunt, by the way...

>  	blr
>  
>  #ifdef CONFIG_VSX
> -- 
> 2.39.2

Cheers,
Gabriel

 

