Return-Path: <linuxppc-dev+bounces-2948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081809BFD08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 04:41:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkSYH5FWKz3bh7;
	Thu,  7 Nov 2024 14:41:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730950899;
	cv=none; b=EBVW40oSMzQKUbbq5BpOSWmB3hTrk2TcRi0Jz/bmM8aptVlJih5O3Ouu7Gqn2N7ErWPhHDxRyT76ownk16zh5W/rIULAFOvyyzZmmLmNqzit4b1njo1XSvmkthbiT2HyYwwRkdfGlhFT3XD78tnIYCRSOjBi07OmTXRW41zQEYPwzRIOdQWWW6HvQm5ECkQBtptT0LXrgfBam3UrQHoYzCdDzKVEKrnoFXY+drtCQXc6aEVgKz9nRZ7f7e1n9RBPGSa9zjfNXHWyqoVA2rVDIRzpPv5FKfU8POLDFjruEABPT/hq0v1aD0a+z27ED0RyrZSBEd1Ia6PCHzmrZ5Gaig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730950899; c=relaxed/relaxed;
	bh=mxuLKlwRhw4zo+iMvghk7QJrAIy3qLJa9taLSRrSEzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ON5VqBQ7gVv0H5mcQ+tlQlu6Aeqp0dBVQLBFSxMPPpWh0iBzDb6zUOCtfew3e24DE2w4XfAZ/gx4olNsArT5VK7M3fq+nSYSylUkNMvlVW0MvY9b39xWPJohzVHo95kok4GitxfHM4UTS3BRqeLwWuqgRWlXUz/ZiW0rER//KVIxt/KaGc5MoGivAqJ32+Lx/+r1W9Ee3UlqtEEoPGLRTqjVmSHOEDBtBgVnckyZqj8pqBI4QpfA8vN2BJbmbV2nQHvNvDUgTNDumH3iHlnwFCg6tO7Q37J25qBGp2L4qWpvk+bGpRY/EvGptZ1jAvHbKWHtPwAFIpfmaTiaJ/jYOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkSYC5RLsz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 14:41:35 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1730950814t0e0qcz
X-QQ-Originating-IP: tMUKnt91/Lm8jmIduWbwLpWLRG6hWTL4I63ijv3/weo=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 Nov 2024 11:40:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17968122228014455855
Date: Thu, 7 Nov 2024 11:40:04 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	npiggin <npiggin@gmail.com>, "luming.yu" <luming.yu@gmail.com>
Subject: Re: [PATCH 1/7] powerpc/entry: convert to common and generic entry
Message-ID: <599B7EE67A30EC61+Zyw2lGpVbOgn0Ai4@HX09040029.powercore.com.cn>
References: <88E2581B1D024E9A+20241012035621.1245-3-luming.yu@shingroup.cn>
 <e9595d8b-d1e2-4c6a-b097-6f4f08d29866@csgroup.eu>
 <tencent_381ACB160B890CC46678170E@qq.com>
 <87o73b37pw.fsf@mail.lhotse>
 <55B30F12C81A25B9+ZxoGx55aKtK7pSNx@HX09040029.powercore.com.cn>
 <6137D77B4C650804+ZxsHXYSWt6fzL-zu@HX09040029.powercore.com.cn>
 <BC7DA92512FD117A+ZymjVjx7DdkahNt4@HX09040029.powercore.com.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BC7DA92512FD117A+ZymjVjx7DdkahNt4@HX09040029.powercore.com.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NahhPvJ71zx0LT4LJUtMblQrfOhCdj8Kv73tsOIlqcAEi7Z7uGii25Mq
	CywUpIfsQqCZFaGekEM8phpsVcI9sZeictVb1oymrE0ehfN+82xjsjo8lUj7wOZo0NSUVzy
	10R/iNgWwtU7O6cEGYswN2s5FxPlQdYtPcX0BU/t/5vNBf+gYHY+2pp/+KcHEBcEEvVsPFz
	726nry0Y6fAzBvHzJqbIBFxcw+alRylucfFKbcJa3EF83fk+duwp30fUZC+gRHLx2kultqK
	3uNSHjric3+bWoam/bLUpx8Y/uRSUI+KKFnqO2QDuhqY+nbwzBGCzo8YiuI+rMDZEq+TZ4o
	IKVH4wGn699n/63VgoptRin8UrdI0WRZoSa9uqLt3FygvmAallxxr2Ajfrb54FC0lnwAZlD
	rQQneGxzoK9ytLb2g9heMhsSl09EdABAZngTYqHaIfdI3NhJ3y9JNMpOfzK0N/36oXhLrig
	CYgCSZVUzQ9T0wmqBTGrhPVnDKDfJ/gRQZwmfbhuE1tOuRDlrvjpkZB69g245EBSwvFzlDM
	isxMAd8Gu31qkq9HlbF2zFzXB/Fk6gs0ozIr0Zm+c63QI7Gpy8ryn2HmJLCmQq43R/ALc2i
	nDSn9g6qbmFHJ9CY6Z/vNbBSubHdYp/Znx7ZnDs84z4ErvuG8dz9TelDusqOzETFMeF9gwP
	MZ/wpDAkd9XeH2JfgbK3R8bnfZwFxeEPqxsw3axTvJK3bj5LbwfA5YXY3d9ynoGAcLD8OvT
	cf0+yXHe7II2VTWzAZ2ZMG/JKLsP0oWuKOAWm+PES3dVX11WLOn5uLeSPIsuin4YJ2p2IDx
	XJk+OQikUfImLIjw7tG8S5ck62ycjVaMxj5LHu1dvyZZQCDtCRO0sByxC1Ouxu6IETznt5o
	uZn0pc34XK28jpaCcnHwVKfBvmFeB3ZcTr/4RdcbuqcR5fo91xQaAMCV159O3dzvknNxjK9
	fiJxDidqinUFmvifg7uIs5QkP
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.9 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URG_BIZ
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 05, 2024 at 12:47:18PM +0800, Luming Yu wrote:
> On Fri, Oct 25, 2024 at 10:50:05AM +0800, Luming Yu wrote:
> > On Thu, Oct 24, 2024 at 04:43:04PM +0800, Luming Yu wrote:
> > > On Wed, Oct 23, 2024 at 12:53:47PM +1100, Michael Ellerman wrote:
> > > > "虞陆铭" <luming.yu@shingroup.cn> writes:
> > > > >>Le 12/10/2024 à 05:56, Luming Yu a écrit :
> > > > >>> convert powerpc entry code in syscall and fault to use syscall_work
> > > > >>> and irqentry_state as well as common calls implemented in generic
> > > > >>> entry infrastructure.
> > > > >>> 
> > > > >>> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> > > > >>> ---
> > > > >>>   arch/powerpc/Kconfig                   | 1 +
> > > > >>>   arch/powerpc/include/asm/hw_irq.h      | 5 +++++
> > > > >>>   arch/powerpc/include/asm/processor.h   | 6 ++++++
> > > > >>>   arch/powerpc/include/asm/syscall.h     | 5 +++++
> > > > >>>   arch/powerpc/include/asm/thread_info.h | 1 +
> > > > >>>   arch/powerpc/kernel/syscall.c          | 5 ++++-
> > > > >>>   arch/powerpc/mm/fault.c                | 3 +++
> > > > >>>   7 files changed, 25 insertions(+), 1 deletion(-)
> > > > >>> 
> > > > >>
> > > > >>...
> > > > >>
> > > > >>> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> > > > >>> index 77fedb190c93..e0338bd8d383 100644
> > > > >>> --- a/arch/powerpc/kernel/syscall.c
> > > > >>> +++ b/arch/powerpc/kernel/syscall.c
> > > > >>> @@ -3,6 +3,7 @@
> > > > >>>   #include <linux/compat.h>
> > > > >>>   #include <linux/context_tracking.h>
> > > > >>>   #include <linux/randomize_kstack.h>
> > > > >>> +#include <linux/entry-common.h>
> > > > >>>   
> > > > >>>   #include <asm/interrupt.h>
> > > > >>>   #include <asm/kup.h>
> > > > >>> @@ -131,7 +132,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
> > > > >>>   		 * and the test against NR_syscalls will fail and the return
> > > > >>>   		 * value to be used is in regs->gpr[3].
> > > > >>>   		 */
> > > > >>> -		r0 = do_syscall_trace_enter(regs);
> > > > >>> +		r0 = syscall_enter_from_user_mode(regs, r0);
> > > > >>
> > > > >>Can you provide details on how this works ?
> > > > > I assume the common entry would take over th details.
> > > > > So I just made the switch from the high level call.
> > > > >
> > >  > As you said as the subtle ABI requirement about regs->r3 needs to
> > > > > be restored, I'm wondering which test can capture the lost
> > > > > ABI feature. As simple Boot test is insufficient, what is the test set
> > > > > that can capture it?
> > > > 
> > > > The seccomp selftest did exercise it back when I originally wrote that
> > > > code. I don't know for sure that it still does, but that would be a good
> > > > start.
> > > > 
> > > > It's in tools/testing/selftests/seccomp/
> > > Thanks for the hint.
> > > It seems to be running into some not ok cases the way hits the bpf test that doesn't return. 
> > > I will re-run with the same kernel w/o the patch-set to sort out the cases that could be
> > > caused by the patch Then I will try to debug out the root cause.
> > w/o the patch set, all ok, as below. So, it would great if the test of feature can be used in
> > linux-ci github workflow. And I'm clear what needs to be done in v2 now.
> Despite being pulled to another urgent business for a while, I managed to sequeeze resource and
> find the clue for the root cause that is a ppc specific test against a flag in thread info. 
> By yanking out the ppc specific test as below, the most seccomp_bpf test run successfully 
> w/ the patch set.
> 
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index dabe7f2b4bd4..2fa517160ef3 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -119,7 +119,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
> 
>         local_irq_enable();
> 
> -       if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
> +       if (1/*unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)*/) {
>                 if (unlikely(trap_is_unsupported_scv(regs))) {
>                         /* Unsupported scv vector */
>                         _exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> 
> Let me clean it up a little bit more then I will send out patch update soon.
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index dabe7f2b4bd4..960a1cd6fb7e 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -119,7 +119,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)

        local_irq_enable();

-       if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
+       if (1 /*unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)*/) {
                if (unlikely(trap_is_unsupported_scv(regs))) {
                        /* Unsupported scv vector */
                        _exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
@@ -132,10 +132,18 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
                 * and the test against NR_syscalls will fail and the return
                 * value to be used is in regs->gpr[3].
                 */
+               if (test_thread_flag(TIF_SECCOMP))
+                       regs->gpr[3] = -ENOSYS;
                r0 = syscall_enter_from_user_mode(regs, r0);
+               if (test_thread_flag(TIF_SECCOMP) && (r0 != -1)) {
+                       regs->gpr[3] = regs->orig_gpr3;
+                       r0 = regs->gpr[0];
+               }
+               if (regs->gpr[0] > NR_syscalls)
+                       regs->gpr[3] = -ENOSYS;
+
                if (unlikely(r0 >= NR_syscalls))
                        return regs->gpr[3];

Trying to mimic the original parameters, pt_regs and return value behavior from the deleted code,
out of 98 seccomp_bpf test cases, there are still two subtle cases failed.

#  RUN           TRACE_syscall.seccomp.syscall_errno ...
# seccomp_bpf.c:2227:syscall_errno:Expected -(-3) (3) == errno (38)
# syscall_errno: Test failed
#          FAIL  TRACE_syscall.seccomp.syscall_errno
not ok 85 TRACE_syscall.seccomp.syscall_errno
#  RUN           TRACE_syscall.seccomp.syscall_faked ...
# seccomp_bpf.c:2233:syscall_faked:Expected 45000 (45000) == syscall(207) (-1)
# syscall_faked: Test failed
#          FAIL  TRACE_syscall.seccomp.syscall_faked
not ok 86 TRACE_syscall.seccomp.syscall_faked
 
Apparently, there is still some magic that needs to be debug out.

# FAILED: 96 / 98 tests passed.
# Totals: pass:96 fail:2 xfail:0 xpass:0 skip:0 error:0


> 
> > [root@10 linux-ci]# make -C tools/testing/selftests TARGETS=seccomp run_tests
> > make: Entering directory '/root/linux-ci/tools/testing/selftests'
> > make[1]: Nothing to be done for 'all'.
> > TAP version 13
> > 1..2
> > # timeout set to 180
> > # selftests: seccomp: seccomp_bpf
> > # TAP version 13
> > # 1..98
> > # # Starting 98 tests from 8 test cases.
> > # #  RUN           global.kcmp ...
> > # #            OK  global.kcmp
> > # ok 1 global.kcmp
> > # #  RUN           global.mode_strict_support ...
> > # #            OK  global.mode_strict_support
> > # ok 2 global.mode_strict_support
> > # #  RUN           global.mode_strict_cannot_call_prctl ...
> > # #            OK  global.mode_strict_cannot_call_prctl
> > # ok 3 global.mode_strict_cannot_call_prctl
> > # #  RUN           global.no_new_privs_support ...
> > # #            OK  global.no_new_privs_support
> > # ok 4 global.no_new_privs_support
> > # #  RUN           global.mode_filter_support ...
> > # #            OK  global.mode_filter_support
> > # ok 5 global.mode_filter_support
> > # #  RUN           global.mode_filter_without_nnp ...
> > # #            OK  global.mode_filter_without_nnp
> > # ok 6 global.mode_filter_without_nnp
> > # #  RUN           global.filter_size_limits ...
> > # #            OK  global.filter_size_limits
> > # ok 7 global.filter_size_limits
> > # #  RUN           global.filter_chain_limits ...
> > # #            OK  global.filter_chain_limits
> > # ok 8 global.filter_chain_limits
> > # #  RUN           global.mode_filter_cannot_move_to_strict ...
> > # #            OK  global.mode_filter_cannot_move_to_strict
> > # ok 9 global.mode_filter_cannot_move_to_strict
> > # #  RUN           global.mode_filter_get_seccomp ...
> > # #            OK  global.mode_filter_get_seccomp
> > # ok 10 global.mode_filter_get_seccomp
> > # #  RUN           global.ALLOW_all ...
> > # #            OK  global.ALLOW_all
> > # ok 11 global.ALLOW_all
> > # #  RUN           global.empty_prog ...
> > # #            OK  global.empty_prog
> > # ok 12 global.empty_prog
> > # #  RUN           global.log_all ...
> > # #            OK  global.log_all
> > # ok 13 global.log_all
> > # #  RUN           global.unknown_ret_is_kill_inside ...
> > # #            OK  global.unknown_ret_is_kill_inside
> > # ok 14 global.unknown_ret_is_kill_inside
> > # #  RUN           global.unknown_ret_is_kill_above_allow ...
> > # #            OK  global.unknown_ret_is_kill_above_allow
> > # ok 15 global.unknown_ret_is_kill_above_allow
> > # #  RUN           global.KILL_all ...
> > # #            OK  global.KILL_all
> > # ok 16 global.KILL_all
> > # #  RUN           global.KILL_one ...
> > # #            OK  global.KILL_one
> > # ok 17 global.KILL_one
> > # #  RUN           global.KILL_one_arg_one ...
> > # #            OK  global.KILL_one_arg_one
> > # ok 18 global.KILL_one_arg_one
> > # #  RUN           global.KILL_one_arg_six ...
> > # #            OK  global.KILL_one_arg_six
> > # ok 19 global.KILL_one_arg_six
> > # #  RUN           global.KILL_thread ...
> > # #            OK  global.KILL_thread
> > # ok 20 global.KILL_thread
> > # #  RUN           global.KILL_process ...
> > # #            OK  global.KILL_process
> > # ok 21 global.KILL_process
> > # #  RUN           global.KILL_unknown ...
> > # #            OK  global.KILL_unknown
> > # ok 22 global.KILL_unknown
> > # #  RUN           global.arg_out_of_range ...
> > # #            OK  global.arg_out_of_range
> > # ok 23 global.arg_out_of_range
> > # #  RUN           global.ERRNO_valid ...
> > # #            OK  global.ERRNO_valid
> > # ok 24 global.ERRNO_valid
> > # #  RUN           global.ERRNO_zero ...
> > # #            OK  global.ERRNO_zero
> > # ok 25 global.ERRNO_zero
> > # #  RUN           global.ERRNO_capped ...
> > # #            OK  global.ERRNO_capped
> > # ok 26 global.ERRNO_capped
> > # #  RUN           global.ERRNO_order ...
> > # #            OK  global.ERRNO_order
> > # ok 27 global.ERRNO_order
> > # #  RUN           global.negative_ENOSYS ...
> > # #            OK  global.negative_ENOSYS
> > # ok 28 global.negative_ENOSYS
> > # #  RUN           global.seccomp_syscall ...
> > # #            OK  global.seccomp_syscall
> > # ok 29 global.seccomp_syscall
> > # #  RUN           global.seccomp_syscall_mode_lock ...
> > # #            OK  global.seccomp_syscall_mode_lock
> > # ok 30 global.seccomp_syscall_mode_lock
> > # #  RUN           global.detect_seccomp_filter_flags ...
> > # #            OK  global.detect_seccomp_filter_flags
> > # ok 31 global.detect_seccomp_filter_flags
> > # #  RUN           global.TSYNC_first ...
> > # #            OK  global.TSYNC_first
> > # ok 32 global.TSYNC_first
> > # #  RUN           global.syscall_restart ...
> > # #            OK  global.syscall_restart
> > # ok 33 global.syscall_restart
> > # #  RUN           global.filter_flag_log ...
> > # #            OK  global.filter_flag_log
> > # ok 34 global.filter_flag_log
> > # #  RUN           global.get_action_avail ...
> > # #            OK  global.get_action_avail
> > # ok 35 global.get_action_avail
> > # #  RUN           global.get_metadata ...
> > # #            OK  global.get_metadata
> > # ok 36 global.get_metadata
> > # #  RUN           global.user_notification_basic ...
> > # #            OK  global.user_notification_basic
> > # ok 37 global.user_notification_basic
> > # #  RUN           global.user_notification_with_tsync ...
> > # #            OK  global.user_notification_with_tsync
> > # ok 38 global.user_notification_with_tsync
> > # #  RUN           global.user_notification_kill_in_middle ...
> > # #            OK  global.user_notification_kill_in_middle
> > # ok 39 global.user_notification_kill_in_middle
> > # #  RUN           global.user_notification_signal ...
> > # #            OK  global.user_notification_signal
> > # ok 40 global.user_notification_signal
> > # #  RUN           global.user_notification_closed_listener ...
> > # #            OK  global.user_notification_closed_listener
> > # ok 41 global.user_notification_closed_listener
> > # #  RUN           global.user_notification_child_pid_ns ...
> > # #            OK  global.user_notification_child_pid_ns
> > # ok 42 global.user_notification_child_pid_ns
> > # #  RUN           global.user_notification_sibling_pid_ns ...
> > # #            OK  global.user_notification_sibling_pid_ns
> > # ok 43 global.user_notification_sibling_pid_ns
> > # #  RUN           global.user_notification_fault_recv ...
> > # #            OK  global.user_notification_fault_recv
> > # ok 44 global.user_notification_fault_recv
> > # #  RUN           global.seccomp_get_notif_sizes ...
> > # #            OK  global.seccomp_get_notif_sizes
> > # ok 45 global.seccomp_get_notif_sizes
> > # #  RUN           global.user_notification_continue ...
> > # #            OK  global.user_notification_continue
> > # ok 46 global.user_notification_continue
> > # #  RUN           global.user_notification_filter_empty ...
> > # #            OK  global.user_notification_filter_empty
> > # ok 47 global.user_notification_filter_empty
> > # #  RUN           global.user_ioctl_notification_filter_empty ...
> > # #            OK  global.user_ioctl_notification_filter_empty
> > # ok 48 global.user_ioctl_notification_filter_empty
> > # #  RUN           global.user_notification_filter_empty_threaded ...
> > # #            OK  global.user_notification_filter_empty_threaded
> > # ok 49 global.user_notification_filter_empty_threaded
> > # #  RUN           global.user_notification_addfd ...
> > # #            OK  global.user_notification_addfd
> > # ok 50 global.user_notification_addfd
> > # #  RUN           global.user_notification_addfd_rlimit ...
> > # #            OK  global.user_notification_addfd_rlimit
> > # ok 51 global.user_notification_addfd_rlimit
> > # #  RUN           global.user_notification_sync ...
> > # #            OK  global.user_notification_sync
> > # ok 52 global.user_notification_sync
> > # #  RUN           global.user_notification_fifo ...
> > # #            OK  global.user_notification_fifo
> > # ok 53 global.user_notification_fifo
> > # #  RUN           global.user_notification_wait_killable_pre_notification ...
> > # #            OK  global.user_notification_wait_killable_pre_notification
> > # ok 54 global.user_notification_wait_killable_pre_notification
> > # #  RUN           global.user_notification_wait_killable ...
> > # #            OK  global.user_notification_wait_killable
> > # ok 55 global.user_notification_wait_killable
> > # #  RUN           global.user_notification_wait_killable_fatal ...
> > # #            OK  global.user_notification_wait_killable_fatal
> > # ok 56 global.user_notification_wait_killable_fatal
> > # #  RUN           global.tsync_vs_dead_thread_leader ...
> > # #            OK  global.tsync_vs_dead_thread_leader
> > # ok 57 global.tsync_vs_dead_thread_leader
> > # #  RUN           TRAP.dfl ...
> > # #            OK  TRAP.dfl
> > # ok 58 TRAP.dfl
> > # #  RUN           TRAP.ign ...
> > # #            OK  TRAP.ign
> > # ok 59 TRAP.ign
> > # #  RUN           TRAP.handler ...
> > # #            OK  TRAP.handler
> > # ok 60 TRAP.handler
> > # #  RUN           precedence.allow_ok ...
> > # #            OK  precedence.allow_ok
> > # ok 61 precedence.allow_ok
> > # #  RUN           precedence.kill_is_highest ...
> > # #            OK  precedence.kill_is_highest
> > # ok 62 precedence.kill_is_highest
> > # #  RUN           precedence.kill_is_highest_in_any_order ...
> > # #            OK  precedence.kill_is_highest_in_any_order
> > # ok 63 precedence.kill_is_highest_in_any_order
> > # #  RUN           precedence.trap_is_second ...
> > # #            OK  precedence.trap_is_second
> > # ok 64 precedence.trap_is_second
> > # #  RUN           precedence.trap_is_second_in_any_order ...
> > # #            OK  precedence.trap_is_second_in_any_order
> > # ok 65 precedence.trap_is_second_in_any_order
> > # #  RUN           precedence.errno_is_third ...
> > # #            OK  precedence.errno_is_third
> > # ok 66 precedence.errno_is_third
> > # #  RUN           precedence.errno_is_third_in_any_order ...
> > # #            OK  precedence.errno_is_third_in_any_order
> > # ok 67 precedence.errno_is_third_in_any_order
> > # #  RUN           precedence.trace_is_fourth ...
> > # #            OK  precedence.trace_is_fourth
> > # ok 68 precedence.trace_is_fourth
> > # #  RUN           precedence.trace_is_fourth_in_any_order ...
> > # #            OK  precedence.trace_is_fourth_in_any_order
> > # ok 69 precedence.trace_is_fourth_in_any_order
> > # #  RUN           precedence.log_is_fifth ...
> > # #            OK  precedence.log_is_fifth
> > # ok 70 precedence.log_is_fifth
> > # #  RUN           precedence.log_is_fifth_in_any_order ...
> > # #            OK  precedence.log_is_fifth_in_any_order
> > # ok 71 precedence.log_is_fifth_in_any_order
> > # #  RUN           TRACE_poke.read_has_side_effects ...
> > # #            OK  TRACE_poke.read_has_side_effects
> > # ok 72 TRACE_poke.read_has_side_effects
> > # #  RUN           TRACE_poke.getpid_runs_normally ...
> > # #            OK  TRACE_poke.getpid_runs_normally
> > # ok 73 TRACE_poke.getpid_runs_normally
> > # #  RUN           TRACE_syscall.ptrace.negative_ENOSYS ...
> > # #            OK  TRACE_syscall.ptrace.negative_ENOSYS
> > # ok 74 TRACE_syscall.ptrace.negative_ENOSYS
> > # #  RUN           TRACE_syscall.ptrace.syscall_allowed ...
> > # #            OK  TRACE_syscall.ptrace.syscall_allowed
> > # ok 75 TRACE_syscall.ptrace.syscall_allowed
> > # #  RUN           TRACE_syscall.ptrace.syscall_redirected ...
> > # #            OK  TRACE_syscall.ptrace.syscall_redirected
> > # ok 76 TRACE_syscall.ptrace.syscall_redirected
> > # #  RUN           TRACE_syscall.ptrace.syscall_errno ...
> > # #            OK  TRACE_syscall.ptrace.syscall_errno
> > # ok 77 TRACE_syscall.ptrace.syscall_errno
> > # #  RUN           TRACE_syscall.ptrace.syscall_faked ...
> > # #            OK  TRACE_syscall.ptrace.syscall_faked
> > # ok 78 TRACE_syscall.ptrace.syscall_faked
> > # #  RUN           TRACE_syscall.ptrace.kill_immediate ...
> > # #            OK  TRACE_syscall.ptrace.kill_immediate
> > # ok 79 TRACE_syscall.ptrace.kill_immediate
> > # #  RUN           TRACE_syscall.ptrace.skip_after ...
> > # #            OK  TRACE_syscall.ptrace.skip_after
> > # ok 80 TRACE_syscall.ptrace.skip_after
> > # #  RUN           TRACE_syscall.ptrace.kill_after ...
> > # #            OK  TRACE_syscall.ptrace.kill_after
> > # ok 81 TRACE_syscall.ptrace.kill_after
> > # #  RUN           TRACE_syscall.seccomp.negative_ENOSYS ...
> > # #            OK  TRACE_syscall.seccomp.negative_ENOSYS
> > # ok 82 TRACE_syscall.seccomp.negative_ENOSYS
> > # #  RUN           TRACE_syscall.seccomp.syscall_allowed ...
> > # #            OK  TRACE_syscall.seccomp.syscall_allowed
> > # ok 83 TRACE_syscall.seccomp.syscall_allowed
> > # #  RUN           TRACE_syscall.seccomp.syscall_redirected ...
> > # #            OK  TRACE_syscall.seccomp.syscall_redirected
> > # ok 84 TRACE_syscall.seccomp.syscall_redirected
> > # #  RUN           TRACE_syscall.seccomp.syscall_errno ...
> > # #            OK  TRACE_syscall.seccomp.syscall_errno
> > # ok 85 TRACE_syscall.seccomp.syscall_errno
> > # #  RUN           TRACE_syscall.seccomp.syscall_faked ...
> > # #            OK  TRACE_syscall.seccomp.syscall_faked
> > # ok 86 TRACE_syscall.seccomp.syscall_faked
> > # #  RUN           TRACE_syscall.seccomp.kill_immediate ...
> > # #            OK  TRACE_syscall.seccomp.kill_immediate
> > # ok 87 TRACE_syscall.seccomp.kill_immediate
> > # #  RUN           TRACE_syscall.seccomp.skip_after ...
> > # #            OK  TRACE_syscall.seccomp.skip_after
> > # ok 88 TRACE_syscall.seccomp.skip_after
> > # #  RUN           TRACE_syscall.seccomp.kill_after ...
> > # #            OK  TRACE_syscall.seccomp.kill_after
> > # ok 89 TRACE_syscall.seccomp.kill_after
> > # #  RUN           TSYNC.siblings_fail_prctl ...
> > # #            OK  TSYNC.siblings_fail_prctl
> > # ok 90 TSYNC.siblings_fail_prctl
> > # #  RUN           TSYNC.two_siblings_with_ancestor ...
> > # #            OK  TSYNC.two_siblings_with_ancestor
> > # ok 91 TSYNC.two_siblings_with_ancestor
> > # #  RUN           TSYNC.two_sibling_want_nnp ...
> > # #            OK  TSYNC.two_sibling_want_nnp
> > # ok 92 TSYNC.two_sibling_want_nnp
> > # #  RUN           TSYNC.two_siblings_with_no_filter ...
> > # #            OK  TSYNC.two_siblings_with_no_filter
> > # ok 93 TSYNC.two_siblings_with_no_filter
> > # #  RUN           TSYNC.two_siblings_with_one_divergence ...
> > # #            OK  TSYNC.two_siblings_with_one_divergence
> > # ok 94 TSYNC.two_siblings_with_one_divergence
> > # #  RUN           TSYNC.two_siblings_with_one_divergence_no_tid_in_err ...
> > # #            OK  TSYNC.two_siblings_with_one_divergence_no_tid_in_err
> > # ok 95 TSYNC.two_siblings_with_one_divergence_no_tid_in_err
> > # #  RUN           TSYNC.two_siblings_not_under_filter ...
> > # #            OK  TSYNC.two_siblings_not_under_filter
> > # ok 96 TSYNC.two_siblings_not_under_filter
> > # #  RUN           O_SUSPEND_SECCOMP.setoptions ...
> > # #            OK  O_SUSPEND_SECCOMP.setoptions
> > # ok 97 O_SUSPEND_SECCOMP.setoptions
> > # #  RUN           O_SUSPEND_SECCOMP.seize ...
> > # #            OK  O_SUSPEND_SECCOMP.seize
> > # ok 98 O_SUSPEND_SECCOMP.seize
> > # # PASSED: 98 / 98 tests passed.
> > # # Totals: pass:98 fail:0 xfail:0 xpass:0 skip:0 error:0
> > ok 1 selftests: seccomp: seccomp_bpf
> > # timeout set to 180
> > # selftests: seccomp: seccomp_benchmark
> > # TAP version 13
> > # 1..7
> > # # Running on:
> > # # Linux 10.0.2.15 6.12.0-rc1-gf85c105361db #6 SMP Thu Oct 24 12:16:15 UTC 2024 ppc64le GNU/Linux
> > # # Current BPF sysctl settings:
> > # # /proc/sys/net/core/bpf_jit_enable:1
> > # # /proc/sys/net/core/bpf_jit_harden:0
> > # Pinned to CPU 16 of 16
> > # # Calibrating sample size for 15 seconds worth of syscalls ...
> > # # Benchmarking 56397315 syscalls...
> > [  263.908829][   C15] sched: DL replenish lagged too much
> > # # 12.720538528 - 0.000000000 = 12720538528 (12.7s)
> > # # getpid native: 225 ns
> > # # 31.362959638 - 12.720723906 = 18642235732 (18.6s)
> > # # getpid RET_ALLOW 1 filter (bitmap): 330 ns
> > # # 50.202651764 - 31.363058760 = 18839593004 (18.8s)
> > # # getpid RET_ALLOW 2 filters (bitmap): 334 ns
> > # # 73.073719578 - 50.202778500 = 22870941078 (22.9s)
> > # # getpid RET_ALLOW 3 filters (full): 405 ns
> > # # 97.560580500 - 73.073834670 = 24486745830 (24.5s)
> > # # getpid RET_ALLOW 4 filters (full): 434 ns
> > # # Estimated total seccomp overhead for 1 bitmapped filter: 105 ns
> > # # Estimated total seccomp overhead for 2 bitmapped filters: 109 ns
> > # # Estimated total seccomp overhead for 3 full filters: 180 ns
> > # # Estimated total seccomp overhead for 4 full filters: 209 ns
> > # # Estimated seccomp entry overhead: 101 ns
> > # # Estimated seccomp per-filter overhead (last 2 diff): 29 ns
> > # # Estimated seccomp per-filter overhead (filters / 4): 27 ns
> > # # Expectations:
> > # #     native ≤ 1 bitmap (225 ≤ 330): ✔️
> > # ok 1 native ≤ 1 bitmap
> > # #     native ≤ 1 filter (225 ≤ 405): ✔️
> > # ok 2 native ≤ 1 filter
> > # #     per-filter (last 2 diff) ≈ per-filter (filters / 4) (29 ≈ 27): ✔️
> > # ok 3 per-filter (last 2 diff) ≈ per-filter (filters / 4)
> > # #     1 bitmapped ≈ 2 bitmapped (105 ≈ 109): ✔️
> > # ok 4 1 bitmapped ≈ 2 bitmapped
> > # #     entry ≈ 1 bitmapped (101 ≈ 105): ✔️
> > # ok 5 entry ≈ 1 bitmapped
> > # #     entry ≈ 2 bitmapped (101 ≈ 109): ✔️
> > # ok 6 entry ≈ 2 bitmapped
> > # #     native + entry + (per filter * 4) ≈ 4 filters total (442 ≈ 434): ✔️
> > # ok 7 native + entry + (per filter * 4) ≈ 4 filters total
> > # # Totals: pass:7 fail:0 xfail:0 xpass:0 skip:0 error:0
> > ok 2 selftests: seccomp: seccomp_benchmark
> > make: Leaving directory '/root/linux-ci/tools/testing/selftests'
> > 
> > 
> > > [root@10 linux-ci]# make -C tools/testing/selftests TARGETS=seccomp run_tests
> > > make: Entering directory '/root/linux-ci/tools/testing/selftests'
> > > make[1]: Nothing to be done for 'all'.
> > > TAP version 13
> > > 1..2
> > > # timeout set to 180
> > > # selftests: seccomp: seccomp_bpf
> > > # TAP version 13
> > > # 1..98
> > > # # Starting 98 tests from 8 test cases.
> > > # #  RUN           global.kcmp ...
> > > # #            OK  global.kcmp
> > > # ok 1 global.kcmp
> > > # #  RUN           global.mode_strict_support ...
> > > # #            OK  global.mode_strict_support
> > > # ok 2 global.mode_strict_support
> > > # #  RUN           global.mode_strict_cannot_call_prctl ...
> > > # # seccomp_bpf.c:359:mode_strict_cannot_call_prctl:Expected 0 (0) == true (1)
> > > # # seccomp_bpf.c:360:mode_strict_cannot_call_prctl:Unreachable!
> > > # # mode_strict_cannot_call_prctl: Test exited normally instead of by signal (code: 1)
> > > # #          FAIL  global.mode_strict_cannot_call_prctl
> > > # not ok 3 global.mode_strict_cannot_call_prctl
> > > # #  RUN           global.no_new_privs_support ...
> > > # #            OK  global.no_new_privs_support
> > > # ok 4 global.no_new_privs_support
> > > # #  RUN           global.mode_filter_support ...
> > > # #            OK  global.mode_filter_support
> > > # ok 5 global.mode_filter_support
> > > # #  RUN           global.mode_filter_without_nnp ...
> > > # #            OK  global.mode_filter_without_nnp
> > > # ok 6 global.mode_filter_without_nnp
> > > # #  RUN           global.filter_size_limits ...
> > > # #            OK  global.filter_size_limits
> > > # ok 7 global.filter_size_limits
> > > # #  RUN           global.filter_chain_limits ...
> > > # #            OK  global.filter_chain_limits
> > > # ok 8 global.filter_chain_limits
> > > # #  RUN           global.mode_filter_cannot_move_to_strict ...
> > > # #            OK  global.mode_filter_cannot_move_to_strict
> > > # ok 9 global.mode_filter_cannot_move_to_strict
> > > # #  RUN           global.mode_filter_get_seccomp ...
> > > # #            OK  global.mode_filter_get_seccomp
> > > # ok 10 global.mode_filter_get_seccomp
> > > # #  RUN           global.ALLOW_all ...
> > > # #            OK  global.ALLOW_all
> > > # ok 11 global.ALLOW_all
> > > # #  RUN           global.empty_prog ...
> > > # #            OK  global.empty_prog
> > > # ok 12 global.empty_prog
> > > # #  RUN           global.log_all ...
> > > # #            OK  global.log_all
> > > # ok 13 global.log_all
> > > # #  RUN           global.unknown_ret_is_kill_inside ...
> > > # # seccomp_bpf.c:621:unknown_ret_is_kill_inside:Expected 0 (0) == syscall(__NR_getpid) (1406)
> > > # # seccomp_bpf.c:622:unknown_ret_is_kill_inside:getpid() shouldn't ever return
> > > # # unknown_ret_is_kill_inside: Test exited normally instead of by signal (code: 1)
> > > # #          FAIL  global.unknown_ret_is_kill_inside
> > > # not ok 14 global.unknown_ret_is_kill_inside
> > > # #  RUN           global.unknown_ret_is_kill_above_allow ...
> > > # # seccomp_bpf.c:643:unknown_ret_is_kill_above_allow:Expected 0 (0) == syscall(__NR_getpid) (1407)
> > > # # seccomp_bpf.c:644:unknown_ret_is_kill_above_allow:getpid() shouldn't ever return
> > > # # unknown_ret_is_kill_above_allow: Test exited normally instead of by signal (code: 1)
> > > # #          FAIL  global.unknown_ret_is_kill_above_allow
> > > # not ok 15 global.unknown_ret_is_kill_above_allow
> > > # #  RUN           global.KILL_all ...
> > > # # KILL_all: Test exited normally instead of by signal (code: 0)
> > > # #          FAIL  global.KILL_all
> > > # not ok 16 global.KILL_all
> > > # #  RUN           global.KILL_one ...
> > > # # seccomp_bpf.c:690:KILL_one:Expected 0 (0) == syscall(__NR_getpid) (1409)
> > > # # KILL_one: Test exited normally instead of by signal (code: 1)
> > > # #          FAIL  global.KILL_one
> > > # not ok 17 global.KILL_one
> > > # #  RUN           global.KILL_one_arg_one ...
> > > # # seccomp_bpf.c:726:KILL_one_arg_one:Expected 0 (0) == syscall(__NR_times, &fatal_address) (4295224651)
> > > # # KILL_one_arg_one: Test exited normally instead of by signal (code: 1)
> > > # #          FAIL  global.KILL_one_arg_one
> > > # not ok 18 global.KILL_one_arg_one
> > > # #  RUN           global.KILL_one_arg_six ...
> > > # # KILL_one_arg_six: Test exited normally instead of by signal (code: 0)
> > > # #          FAIL  global.KILL_one_arg_six
> > > # not ok 19 global.KILL_one_arg_six
> > > # #  RUN           global.KILL_thread ...
> > > # # seccomp_bpf.c:856:KILL_thread:Expected SIBLING_EXIT_FAILURE (195951310) != (unsigned long)status (195951310)
> > > # # seccomp_bpf.c:881:KILL_thread:Expected 0 (0) != WIFEXITED(status) (0)
> > > # # KILL_thread: Test terminated by assertion
> > > # #          FAIL  global.KILL_thread
> > > # not ok 20 global.KILL_thread
> > > # #  RUN           global.KILL_process ...
> > > # # seccomp_bpf.c:856:KILL_process:Expected SIBLING_EXIT_FAILURE (195951310) != (unsigned long)status (195951310)
> > > # # seccomp_bpf.c:901:KILL_process:Expected SIGSYS (31) == WTERMSIG(status) (6)
> > > # # KILL_process: Test terminated by assertion
> > > # #          FAIL  global.KILL_process
> > > # not ok 21 global.KILL_process
> > > # #  RUN           global.KILL_unknown ...
> > > # # seccomp_bpf.c:856:KILL_unknown:Expected SIBLING_EXIT_FAILURE (195951310) != (unsigned long)status (195951310)
> > > # # seccomp_bpf.c:922:KILL_unknown:Expected SIGSYS (31) == WTERMSIG(status) (6)
> > > # # KILL_unknown: Test terminated by assertion
> > > # #          FAIL  global.KILL_unknown
> > > # not ok 22 global.KILL_unknown
> > > # #  RUN           global.arg_out_of_range ...
> > > # #            OK  global.arg_out_of_range
> > > # ok 23 global.arg_out_of_range
> > > # #  RUN           global.ERRNO_valid ...
> > > # # seccomp_bpf.c:974:ERRNO_valid:Expected E2BIG (7) == errno (9)
> > > # # ERRNO_valid: Test failed
> > > # #          FAIL  global.ERRNO_valid
> > > # not ok 24 global.ERRNO_valid
> > > # #  RUN           global.ERRNO_zero ...
> > > # # seccomp_bpf.c:992:ERRNO_zero:Expected 0 (0) == read(-1, NULL, 0) (-1)
> > > # # ERRNO_zero: Test failed
> > > # #          FAIL  global.ERRNO_zero
> > > # not ok 25 global.ERRNO_zero
> > > # #  RUN           global.ERRNO_capped ...
> > > # # seccomp_bpf.c:1014:ERRNO_capped:Expected 4095 (4095) == errno (9)
> > > # # ERRNO_capped: Test failed
> > > # #          FAIL  global.ERRNO_capped
> > > # not ok 26 global.ERRNO_capped
> > > # #  RUN           global.ERRNO_order ...
> > > # # seccomp_bpf.c:1045:ERRNO_order:Expected 12 (12) == errno (9)
> > > # # ERRNO_order: Test failed
> > > # #          FAIL  global.ERRNO_order
> > > # not ok 27 global.ERRNO_order
> > > # #  RUN           global.negative_ENOSYS ...
> > > # #            OK  global.negative_ENOSYS
> > > # ok 28 global.negative_ENOSYS
> > > # #  RUN           global.seccomp_syscall ...
> > > # #            OK  global.seccomp_syscall
> > > # ok 29 global.seccomp_syscall
> > > # #  RUN           global.seccomp_syscall_mode_lock ...
> > > # #            OK  global.seccomp_syscall_mode_lock
> > > # ok 30 global.seccomp_syscall_mode_lock
> > > # #  RUN           global.detect_seccomp_filter_flags ...
> > > # #            OK  global.detect_seccomp_filter_flags
> > > # ok 31 global.detect_seccomp_filter_flags
> > > # #  RUN           global.TSYNC_first ...
> > > # #            OK  global.TSYNC_first
> > > # ok 32 global.TSYNC_first
> > > # #  RUN           global.syscall_restart ...
> > > # # syscall_restart: Test terminated by timeout
> > > # #          FAIL  global.syscall_restart
> > > # not ok 33 global.syscall_restart
> > > # #  RUN           global.filter_flag_log ...
> > > # # seccomp_bpf.c:3239:filter_flag_log:Expected 0 (0) == syscall(__NR_getpid) (1482)
> > > # # filter_flag_log: Test exited normally instead of by signal (code: 1)
> > > # #          FAIL  global.filter_flag_log
> > > # not ok 34 global.filter_flag_log
> > > # #  RUN           global.get_action_avail ...
> > > # #            OK  global.get_action_avail
> > > # ok 35 global.get_action_avail
> > > # #  RUN           global.get_metadata ...
> > > # #            OK  global.get_metadata
> > > # ok 36 global.get_metadata
> > > # #  RUN           global.user_notification_basic ...
> > > # # seccomp_bpf.c:3397:user_notification_basic:Expected 0 (0) == WEXITSTATUS(status) (1)
> > > # # user_notification_basic: Test terminated by timeout
> > > # #          FAIL  global.user_notification_basic
> > > # not ok 37 global.user_notification_basic
> > > # #  RUN           global.user_notification_with_tsync ...
> > > # #            OK  global.user_notification_with_tsync
> > > # ok 38 global.user_notification_with_tsync
> > > # #  RUN           global.user_notification_kill_in_middle ...
> > > # # user_notification_kill_in_middle: Test terminated by timeout
> > > # #          FAIL  global.user_notification_kill_in_middle
> > > # not ok 39 global.user_notification_kill_in_middle
> > > # #  RUN           global.user_notification_signal ...
> > > # # user_notification_signal: Test terminated by timeout
> > > # #          FAIL  global.user_notification_signal
> > > # not ok 40 global.user_notification_signal
> > > # #  RUN           global.user_notification_closed_listener ...
> > > # # seccomp_bpf.c:3647:user_notification_closed_listener:Expected 0 (0) == WEXITSTATUS(status) (1)
> > > # # user_notification_closed_listener: Test failed
> > > # #          FAIL  global.user_notification_closed_listener
> > > # not ok 41 global.user_notification_closed_listener
> > > # #  RUN           global.user_notification_child_pid_ns ...
> > > # # user_notification_child_pid_ns: Test terminated by timeout
> > > # #          FAIL  global.user_notification_child_pid_ns
> > > # not ok 42 global.user_notification_child_pid_ns
> > > # #  RUN           global.user_notification_sibling_pid_ns ...
> > > # # seccomp_bpf.c:3728:user_notification_sibling_pid_ns:Expected 0 (0) == WEXITSTATUS(status) (1)
> > > # # seccomp_bpf.c:3764:user_notification_sibling_pid_ns:Expected 0 (0) == WEXITSTATUS(status) (1)
> > > 
> > > 
> > > > 
> > > > cheers
> > > > 
> > > 
> > 
> 


