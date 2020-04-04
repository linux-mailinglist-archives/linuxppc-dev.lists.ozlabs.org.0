Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2819E5F6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 17:00:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vg3Q5QvNzDrQL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 02:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vg0L5pXxzDrPj
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 01:58:03 +1100 (AEDT)
IronPort-SDR: o91YJk1Nj9/sET3Eq1W7uaeScuL11kMPVsJjOsp/Ds74vfRzWZ2rERB3OjnFdoqZZo7vpKe3kV
 iVz/F/prsdGQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2020 07:57:59 -0700
IronPort-SDR: YdSJWnPMylg9MFd04372KCqMNa3+E2sJLxZ9Fbml0AqhvZwQ6fmcatp7yfOEfz0ucc7Pf4aOjc
 5LEcu6djlFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,344,1580803200"; 
 d="gz'50?scan'50,208,50";a="397036347"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 04 Apr 2020 07:57:57 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jKkFA-000BjB-OP; Sat, 04 Apr 2020 22:57:56 +0800
Date: Sat, 4 Apr 2020 22:56:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] powerpc/uaccess: add more __builtin_expect
 annotations
Message-ID: <202004042205.tqXa24QI%lkp@intel.com>
References: <20200403093529.43587-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <20200403093529.43587-4-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.6 next-20200404]
[cannot apply to scottwood/next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64s-implement-probe_kernel_read-write-without-touching-AMR/20200404-192647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-rhel-kconfig (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from arch/powerpc/include/asm/sections.h:7,
                    from include/linux/interrupt.h:20,
                    from include/linux/serial_core.h:13,
                    from drivers/of/fdt.c:25:
   include/asm-generic/termios-base.h: In function 'user_termio_to_kernel_termios':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> include/asm-generic/termios-base.h:20:6: note: in expansion of macro 'get_user'
      20 |  if (get_user(tmp, &termio->c_iflag) < 0)
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:24:6: note: in expansion of macro 'get_user'
      24 |  if (get_user(tmp, &termio->c_oflag) < 0)
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:28:6: note: in expansion of macro 'get_user'
      28 |  if (get_user(tmp, &termio->c_cflag) < 0)
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:32:6: note: in expansion of macro 'get_user'
      32 |  if (get_user(tmp, &termio->c_lflag) < 0)
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:36:6: note: in expansion of macro 'get_user'
      36 |  if (get_user(termios->c_line, &termio->c_line) < 0)
         |      ^~~~~~~~
   include/asm-generic/termios-base.h: In function 'kernel_termios_to_user_termio':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> include/asm-generic/termios-base.h:54:6: note: in expansion of macro 'put_user'
      54 |  if (put_user(termios->c_iflag, &termio->c_iflag) < 0 ||
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:55:6: note: in expansion of macro 'put_user'
      55 |      put_user(termios->c_oflag, &termio->c_oflag) < 0 ||
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:56:6: note: in expansion of macro 'put_user'
      56 |      put_user(termios->c_cflag, &termio->c_cflag) < 0 ||
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:57:6: note: in expansion of macro 'put_user'
      57 |      put_user(termios->c_lflag, &termio->c_lflag) < 0 ||
         |      ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/termios-base.h:58:6: note: in expansion of macro 'put_user'
      58 |      put_user(termios->c_line,  &termio->c_line) < 0 ||
         |      ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/powerpc/kernel/signal_32.c:23:
   arch/powerpc/kernel/signal_32.c: In function 'handle_rt_signal32':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/signal_32.c:967:6: note: in expansion of macro 'put_user'
     967 |  if (put_user(regs->gpr[1], (u32 __user *)newsp))
         |      ^~~~~~~~
   arch/powerpc/kernel/signal_32.c: In function 'handle_signal32':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/signal_32.c:1423:6: note: in expansion of macro 'put_user'
    1423 |  if (put_user(regs->gpr[1], (u32 __user *)newsp))
         |      ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from arch/powerpc/kernel/process.c:16:
   arch/powerpc/kernel/process.c: In function 'get_fpexc_mode':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/process.c:1909:9: note: in expansion of macro 'put_user'
    1909 |  return put_user(val, (unsigned int __user *) adr);
         |         ^~~~~~~~
   arch/powerpc/kernel/process.c: In function 'get_endian':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/process.c:1953:9: note: in expansion of macro 'put_user'
    1953 |  return put_user(val, (unsigned int __user *)adr);
         |         ^~~~~~~~
   arch/powerpc/kernel/process.c: In function 'get_unalign_ctl':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/process.c:1964:9: note: in expansion of macro 'put_user'
    1964 |  return put_user(tsk->thread.align_ctl, (unsigned int __user *)adr);
         |         ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/powerpc/kernel/traps.c:22:
   arch/powerpc/kernel/traps.c: In function 'emulate_string_inst':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/traps.c:1243:9: note: in expansion of macro 'get_user'
    1243 |     if (get_user(val, (u8 __user *)EA))
         |         ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/traps.c:1254:9: note: in expansion of macro 'put_user'
    1254 |     if (put_user(val, (u8 __user *)EA))
         |         ^~~~~~~~
   arch/powerpc/kernel/traps.c: In function 'emulate_instruction':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:1338:6: note: in expansion of macro 'get_user'
    1338 |  if (get_user(instword, (u32 __user *)(regs->nip)))
         |      ^~~~~~~~
   arch/powerpc/kernel/traps.c: In function 'facility_unavailable_exception':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:1770:7: note: in expansion of macro 'get_user'
    1770 |   if (get_user(instword, (u32 __user *)(regs->nip))) {
         |       ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from arch/powerpc/kernel/signal_64.c:21:
   arch/powerpc/kernel/signal_64.c: In function '__do_sys_swapcontext':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/signal_64.c:644:6: note: in expansion of macro 'get_user'
     644 |      get_user(new_msr, &new_ctx->uc_mcontext.gp_regs[PT_MSR]))
         |      ^~~~~~~~
   arch/powerpc/kernel/signal_64.c: In function 'handle_rt_signal64':
   arch/powerpc/include/asm/uaccess.h:194:2: warning: statement with no effect [-Wunused-value]
     194 |  __pu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:91:2: note: in expansion of macro '__put_user_check'
      91 |  __put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/signal_64.c:880:9: note: in expansion of macro 'put_user'
     880 |  err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
         |         ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/signal_64.c:895:10: note: in expansion of macro 'get_user'
     895 |   err |= get_user(regs->nip, &funct_desc_ptr->entry);
         |          ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/signal_64.c:896:10: note: in expansion of macro 'get_user'
     896 |   err |= get_user(regs->gpr[2], &funct_desc_ptr->toc);
         |          ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/signal_64.c:906:10: note: in expansion of macro 'get_user'
     906 |   err |= get_user(regs->gpr[4], (unsigned long __user *)&frame->pinfo);
         |          ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/signal_64.c:907:10: note: in expansion of macro 'get_user'
     907 |   err |= get_user(regs->gpr[5], (unsigned long __user *)&frame->puc);
         |          ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from arch/powerpc/kernel/vecemu.c:12:
   arch/powerpc/kernel/vecemu.c: In function 'emulate_altivec':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/vecemu.c:267:6: note: in expansion of macro 'get_user'
     267 |  if (get_user(instr, (unsigned int __user *) regs->nip))
         |      ^~~~~~~~
--
   In file included from include/linux/uaccess.h:11,
                    from arch/powerpc/include/asm/sections.h:7,
                    from include/linux/interrupt.h:20,
                    from arch/powerpc/include/asm/kvm_host.h:14,
                    from include/linux/kvm_host.h:36,
                    from arch/powerpc/kvm/../../../virt/kvm/vfio.c:11:
   arch/powerpc/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_set_group':
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:196:7: note: in expansion of macro 'get_user'
     196 |   if (get_user(fd, argp))
         |       ^~~~~~~~
   arch/powerpc/include/asm/uaccess.h:328:2: warning: statement with no effect [-Wunused-value]
     328 |  __gu_err;       \
         |  ^~~~~~~~
>> arch/powerpc/include/asm/uaccess.h:89:2: note: in expansion of macro '__get_user_check'
      89 |  __get_user_check((x), (ptr), sizeof(*(ptr)))
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/vfio.c:240:7: note: in expansion of macro 'get_user'
     240 |   if (get_user(fd, argp))
         |       ^~~~~~~~
..

vim +/__get_user_check +89 arch/powerpc/include/asm/uaccess.h

2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   64  
96d4f267e40f95 arch/powerpc/include/asm/uaccess.h Linus Torvalds         2019-01-03   65  #define access_ok(addr, size)		\
4caf4ebfe4cf0e arch/powerpc/include/asm/uaccess.h Linus Torvalds         2019-01-04   66  	(__chk_user_ptr(addr),		\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   67  	 __access_ok((__force unsigned long)(addr), (size), get_fs()))
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   68  
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   69  /*
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   70   * These are the main single-value transfer routines.  They automatically
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   71   * use the right size if we just have the right pointer type.
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   72   *
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   73   * This gets kind of ugly. We want to return _two_ values in "get_user()"
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   74   * and yet we don't want to do any pointers, because that is too much
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   75   * of a performance impact. Thus we have a few rather ugly macros here,
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   76   * and hide all the ugliness from the user.
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   77   *
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   78   * The "__xxx" versions of the user access functions are versions that
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   79   * do not verify the address space, that must have been done previously
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   80   * with a separate "access_ok()" call (this is used when we do multiple
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   81   * accesses to the same area of user memory).
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   82   *
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   83   * As we use the same address space for kernel and user data on the
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   84   * PowerPC, we can just do these as direct assignments.  (Of course, the
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   85   * exception handling means that it's no longer "just"...)
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   86   *
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   87   */
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   88  #define get_user(x, ptr) \
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  @89  	__get_user_check((x), (ptr), sizeof(*(ptr)))
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   90  #define put_user(x, ptr) \
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  @91  	__put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   92  
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   93  #define __get_user(x, ptr) \
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24   94  	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), true)
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29   95  #define __put_user(x, ptr) \
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24   96  	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), true)
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24   97  
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24   98  #define __get_user_allowed(x, ptr) \
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24   99  	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), false)
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  100  #define __put_user_allowed(x, ptr) \
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  101  	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), false)
e68c825bb01670 include/asm-powerpc/uaccess.h      Benjamin Herrenschmidt 2007-04-11  102  
e68c825bb01670 include/asm-powerpc/uaccess.h      Benjamin Herrenschmidt 2007-04-11  103  #define __get_user_inatomic(x, ptr) \
e68c825bb01670 include/asm-powerpc/uaccess.h      Benjamin Herrenschmidt 2007-04-11  104  	__get_user_nosleep((x), (ptr), sizeof(*(ptr)))
e68c825bb01670 include/asm-powerpc/uaccess.h      Benjamin Herrenschmidt 2007-04-11  105  #define __put_user_inatomic(x, ptr) \
e68c825bb01670 include/asm-powerpc/uaccess.h      Benjamin Herrenschmidt 2007-04-11  106  	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
e68c825bb01670 include/asm-powerpc/uaccess.h      Benjamin Herrenschmidt 2007-04-11  107  
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  108  extern long __put_user_bad(void);
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  109  
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  110  /*
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  111   * We don't tell gcc that we are accessing memory, but this is OK
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  112   * because we do not write to any memory gcc knows about, so there
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  113   * are no aliasing issues.
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  114   */
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  115  #define __put_user_asm(x, addr, err, op)			\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  116  	__asm__ __volatile__(					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  117  		"1:	" op " %1,0(%2)	# put_user\n"		\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  118  		"2:\n"						\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  119  		".section .fixup,\"ax\"\n"			\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  120  		"3:	li %0,%3\n"				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  121  		"	b 2b\n"					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  122  		".previous\n"					\
24bfa6a9e0d4fe arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2016-10-13  123  		EX_TABLE(1b, 3b)				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  124  		: "=r" (err)					\
551c3c04b478b9 include/asm-powerpc/uaccess.h      Michael Ellerman       2008-07-17  125  		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  126  
5015b49448cbe5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-31  127  #ifdef __powerpc64__
5015b49448cbe5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-31  128  #define __put_user_asm2(x, ptr, retval)				\
5015b49448cbe5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-31  129  	  __put_user_asm(x, ptr, retval, "std")
5015b49448cbe5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-31  130  #else /* __powerpc64__ */
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  131  #define __put_user_asm2(x, addr, err)				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  132  	__asm__ __volatile__(					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  133  		"1:	stw %1,0(%2)\n"				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  134  		"2:	stw %1+1,4(%2)\n"			\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  135  		"3:\n"						\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  136  		".section .fixup,\"ax\"\n"			\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  137  		"4:	li %0,%3\n"				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  138  		"	b 3b\n"					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  139  		".previous\n"					\
24bfa6a9e0d4fe arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2016-10-13  140  		EX_TABLE(1b, 4b)				\
24bfa6a9e0d4fe arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2016-10-13  141  		EX_TABLE(2b, 4b)				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  142  		: "=r" (err)					\
551c3c04b478b9 include/asm-powerpc/uaccess.h      Michael Ellerman       2008-07-17  143  		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  144  #endif /* __powerpc64__ */
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  145  
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  146  #define __put_user_size_allowed(x, ptr, size, retval)		\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  147  do {								\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  148  	retval = 0;						\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  149  	switch (size) {						\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  150  	  case 1: __put_user_asm(x, ptr, retval, "stb"); break;	\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  151  	  case 2: __put_user_asm(x, ptr, retval, "sth"); break;	\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  152  	  case 4: __put_user_asm(x, ptr, retval, "stw"); break;	\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  153  	  case 8: __put_user_asm2(x, ptr, retval); break;	\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  154  	  default: __put_user_bad();				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  155  	}							\
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  156  } while (0)
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  157  
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  158  #define __put_user_size(x, ptr, size, retval)			\
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  159  do {								\
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  160  	allow_write_to_user(ptr, size);				\
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  161  	__put_user_size_allowed(x, ptr, size, retval);		\
de78a9c42a7900 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2019-04-18  162  	prevent_write_to_user(ptr, size);			\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  163  } while (0)
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  164  
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  165  #define __put_user_nocheck(x, ptr, size, do_allow)			\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  166  ({								\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  167  	long __pu_err;						\
6bfd93c32a5065 include/asm-powerpc/uaccess.h      Paul Mackerras         2006-05-03  168  	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  169  	__typeof__(*(ptr)) __pu_val = (x);			\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  170  	__typeof__(size) __pu_size = (size);			\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  171  								\
6bfd93c32a5065 include/asm-powerpc/uaccess.h      Paul Mackerras         2006-05-03  172  	if (!is_kernel_addr((unsigned long)__pu_addr))		\
1af1717dbf96eb arch/powerpc/include/asm/uaccess.h Michael S. Tsirkin     2013-05-26  173  		might_fault();					\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  174  	__chk_user_ptr(__pu_addr);				\
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  175  	if (do_allow)								\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  176  		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err);	\
5cd623333e7cf4 arch/powerpc/include/asm/uaccess.h Christophe Leroy       2020-01-24  177  	else									\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  178  		__put_user_size_allowed(__pu_val, __pu_addr, __pu_size, __pu_err); \
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  179  								\
958106a072021d arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  180  	__builtin_expect(__pu_err, 0);				\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  181  })
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  182  
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  183  #define __put_user_check(x, ptr, size)					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  184  ({									\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  185  	long __pu_err = -EFAULT;					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  186  	__typeof__(*(ptr)) __user *__pu_addr = (ptr);			\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  187  	__typeof__(*(ptr)) __pu_val = (x);				\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  188  	__typeof__(size) __pu_size = (size);				\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  189  									\
1af1717dbf96eb arch/powerpc/include/asm/uaccess.h Michael S. Tsirkin     2013-05-26  190  	might_fault();							\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  191  	if (access_ok(__pu_addr, __pu_size))				\
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  192  		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
fea87fb7a00046 arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  193  									\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29 @194  	__pu_err;							\
958106a072021d arch/powerpc/include/asm/uaccess.h Nicholas Piggin        2020-04-03  195  	__builtin_expect(__pu_err, 0);					\
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  196  })
2df5e8bcca53e5 include/asm-powerpc/uaccess.h      Stephen Rothwell       2005-10-29  197  

:::::: The code at line 89 was first introduced by commit
:::::: 2df5e8bcca53e528a78ee0e3b114d0d21dd6d043 powerpc: merge uaccess.h

:::::: TO: Stephen Rothwell <sfr@canb.auug.org.au>
:::::: CC: Stephen Rothwell <sfr@canb.auug.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--9amGYk9869ThD9tj
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
8AAA

--9amGYk9869ThD9tj--
