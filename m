Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979031749E8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 00:00:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VMLZ4ZTczDrCW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 10:00:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VMK240tvzDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 09:58:46 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1j8Azv-0002Fq-N3; Sat, 29 Feb 2020 16:54:15 -0600
Message-ID: <530c49dfd97c811dc53ffc78c594d7133f7eb1e9.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Jason Yan <yanaijie@huawei.com>, Daniel Axtens <dja@axtens.net>, 
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, 
 christophe.leroy@c-s.fr, benh@kernel.crashing.org, paulus@samba.org, 
 npiggin@gmail.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com
Date: Sat, 29 Feb 2020 16:54:14 -0600
In-Reply-To: <188971ed-f1c4-39b3-c07e-89cc593d88d7@huawei.com>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <87tv3drf79.fsf@dja-thinkpad.axtens.net>
 <8171d326-5138-4f5c-cff6-ad3ee606f0c2@huawei.com>
 <e8cd8f287934954cfa07dcf76ac73492e2d49a5b.camel@buserror.net>
 <dd8db870-b607-3f74-d3bc-a8d9f33f9852@huawei.com>
 <4c0e7fec63dbc7b91fa6c24692c73c256c131f51.camel@buserror.net>
 <188971ed-f1c4-39b3-c07e-89cc593d88d7@huawei.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: yanaijie@huawei.com, dja@axtens.net, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, christophe.leroy@c-s.fr,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v3 0/6] implement KASLR for powerpc/fsl_booke/64
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-02-29 at 15:27 +0800, Jason Yan wrote:
> 
> 在 2020/2/29 12:28, Scott Wood 写道:
> > On Fri, 2020-02-28 at 14:47 +0800, Jason Yan wrote:
> > > 
> > > 在 2020/2/28 13:53, Scott Wood 写道:
> > > > 
> > > > I don't see any debug setting for %pK (or %p) to always print the
> > > > actual
> > > > address (closest is kptr_restrict=1 but that only works in certain
> > > > contexts)... from looking at the code it seems it hashes even if kaslr
> > > > is
> > > > entirely disabled?  Or am I missing something?
> > > > 
> > > 
> > > Yes, %pK (or %p) always hashes whether kaslr is disabled or not. So if
> > > we want the real value of the address, we cannot use it. But if you only
> > > want to distinguish if two pointers are the same, it's ok.
> > 
> > Am I the only one that finds this a bit crazy?  If you want to lock a
> > system
> > down then fine, but why wage war on debugging even when there's no
> > randomization going on?  Comparing two pointers for equality is not always
> > adequate.
> > 
> 
> AFAIK, %p hashing is only exist because of many legacy address printings
> and force who really want the raw values to switch to %px or even %lx.
> It's not the opposite of debugging. Raw address printing is not
> forbidden, only people need to estimate the risk of adrdress leaks.

Yes, but I don't see any format specifier to switch to that will hash in a
randomized production environment, but not in a debug or other non-randomized
environment which seems like the ideal default for most debug output.

> 
> Turnning to %p may not be a good idea in this situation. So
> for the REG logs printed when dumping stack, we can disable it when
> KASLR is open. For the REG logs in other places like show_regs(), only
> privileged can trigger it, and they are not combind with a symbol, so
> I think it's ok to keep them.
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index fad50db9dcf2..659c51f0739a 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2068,7 +2068,10 @@ void show_stack(struct task_struct *tsk, unsigned 
> long *stack)
>                  newsp = stack[0];
>                  ip = stack[STACK_FRAME_LR_SAVE];
>                  if (!firstframe || ip != lr) {
> -                       printk("["REG"] ["REG"] %pS", sp, ip, (void *)ip);
> +                       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE))
> +                               printk("%pS", (void *)ip);
> +                       else
> +                               printk("["REG"] ["REG"] %pS", sp, ip, 
> (void *)ip);

This doesn't deal with "nokaslr" on the kernel command line.  It also doesn't
seem like something that every callsite should have to opencode, versus having
an appropriate format specifier behaves as I described above (and I still
don't see why that format specifier should not be "%p").

-Scott


