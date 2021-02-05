Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 827EF310428
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 05:47:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX2w02ndszDsqM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 15:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.110;
 helo=mta-14-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-14-3.privateemail.com (mta-14-3.privateemail.com
 [198.54.127.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX2tT3mz7zDvZv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 15:46:08 +1100 (AEDT)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 7ED1680096;
 Thu,  4 Feb 2021 23:46:05 -0500 (EST)
Received: from localhost (unknown [10.20.151.229])
 by mta-14.privateemail.com (Postfix) with ESMTPA id 39A2080090;
 Fri,  5 Feb 2021 04:46:05 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v5 10/10] powerpc/signal64: Use __get_user() to copy
 sigset_t
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christopher M. Riedl" <cmr@codefail.de>, <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 04 Feb 2021 22:40:08 -0600
Message-Id: <C91BJPHEXZJA.38RMLDMLEMKO3@geist>
In-Reply-To: <20210203184323.20792-11-cmr@codefail.de>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Feb 3, 2021 at 12:43 PM CST, Christopher M. Riedl wrote:
> Usually sigset_t is exactly 8B which is a "trivial" size and does not
> warrant using __copy_from_user(). Use __get_user() directly in
> anticipation of future work to remove the trivial size optimizations
> from __copy_from_user(). Calling __get_user() also results in a small
> boost to signal handling throughput here.
>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>

This patch triggered sparse warnings about 'different address spaces'.
This minor fixup cleans that up:

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_6=
4.c
index 42fdc4a7ff72..1dfda6403e14 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -97,7 +97,7 @@ static void prepare_setup_sigcontext(struct task_struct *=
tsk, int ctx_has_vsx_re
 #endif /* CONFIG_VSX */
 }

-static inline int get_user_sigset(sigset_t *dst, const sigset_t *src)
+static inline int get_user_sigset(sigset_t *dst, const sigset_t __user *sr=
c)
 {
	if (sizeof(sigset_t) <=3D 8)
		return __get_user(dst->sig[0], &src->sig[0]);
