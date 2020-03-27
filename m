Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872C1961BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 00:04:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48py8x5nlWzDrML
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 10:04:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=yu-cheng.yu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48plJ54BS2zDrDJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 01:54:32 +1100 (AEDT)
IronPort-SDR: Q2ATlSRvUNavmygUm0uKKwIh/SwzH9ms/iIHYOIeSW0zuTygDvQ78mBkClxYHIgtVOGxsi+KNc
 buKwImkeajvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 07:54:28 -0700
IronPort-SDR: PHyV6t8vz3ztXAUHikFSN4FujU89Aw6/6odNxAQxtotg7raSj/OegyjNL/hLR2qwoH5rg135WX
 YUHR3HKBd2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="447441013"
Received: from yyu32-desk.sc.intel.com ([143.183.136.146])
 by fmsmga005.fm.intel.com with ESMTP; 27 Mar 2020 07:54:28 -0700
Message-ID: <d10b81d0c4f97140bf3e2a96967ebc2711042d3b.camel@intel.com>
Subject: Re: [yyu168-linux_cet:cet 55/58] powerpc64le-linux-ld: warning:
 discarding dynamic section .rela___ksymtab+jiffies_to_timeval
From: Yu-cheng Yu <yu-cheng.yu@intel.com>
To: "H.J. Lu" <hjl.tools@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 07:54:28 -0700
In-Reply-To: <CAMe9rOrFV0E9N8f-NZeOP+=SSERK-ptUoZrJiS3wgxqjpLhP3Q@mail.gmail.com>
References: <202002050743.dc2PtIsm%lkp@intel.com>
 <CAMe9rOrJEVL8Qw3fgm9FeDjwGZNxGoZ-OO6bfmV=gtK=g68cvQ@mail.gmail.com>
 <87wo901jm0.fsf@mpe.ellerman.id.au>
 <CAMe9rOrFV0E9N8f-NZeOP+=SSERK-ptUoZrJiS3wgxqjpLhP3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 28 Mar 2020 10:02:36 +1100
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kbuild-all@lists.01.org,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-02-06 at 04:55 -0800, H.J. Lu wrote:
> On Wed, Feb 5, 2020 at 7:26 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > "H.J. Lu" <hjl.tools@gmail.com> writes:
> > > On Tue, Feb 4, 2020 at 3:37 PM kbuild test robot <lkp@intel.com> wrote:
> > > > tree:   https://github.com/yyu168/linux_cet.git cet
> > > > head:   bba707cc4715c1036b6561ab38b16747f9c49cfa
> > > > commit: 71bb971dd76eeacd351690f28864ad5c5bec3691 [55/58] Discard .note.gnu.property sections in generic NOTES
> > > > config: powerpc-rhel-kconfig (attached as .config)
> > > > compiler: powerpc64le-linux-gcc (GCC) 7.5.0
> > > > reproduce:
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         git checkout 71bb971dd76eeacd351690f28864ad5c5bec3691
> > > >         # save the attached .config to linux build tree
> > > >         GCC_VERSION=7.5.0 make.cross ARCH=powerpc
> > > > 
> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > 
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > >    powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksymtab_gpl+__wait_rcu_gp
> > > 
> > > arch/powerpc/kernel/vmlinux.lds.S has
> > > 
> > >  .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> > >  {
> > >   __rela_dyn_start = .;
> > >   *(.rela*) <<<<<<<< Keep .rela* sections
> > >  }
> > 
> > The above is inside #ifdef CONFIG_RELOCATABLE
> > 
> > > ...
> > >  /DISCARD/ : {
> > >   *(*.EMB.apuinfo)
> > >   *(.glink .iplt .plt .rela* .comment)
> > >                            ^^^^ Discard  .rela* sections.  But it is ignored.
> > >   *(.gnu.version*)
> > >   *(.gnu.attributes)
> > >   *(.eh_frame)
> > >  }
> > 
> > But that is not #ifdef'ed at all.
> > 
> > > With my
> > > 
> > > ommit 71bb971dd76eeacd351690f28864ad5c5bec3691
> > > Author: H.J. Lu <hjl.tools@gmail.com>
> > > Date:   Thu Jan 30 12:39:09 2020 -0800
> > > 
> > >     Discard .note.gnu.property sections in generic NOTES
> > > 
> > >     With the command-line option, -mx86-used-note=yes, the x86 assembler
> > >     in binutils 2.32 and above generates a program property note in a note
> > >     section, .note.gnu.property, to encode used x86 ISAs and features.  But
> > >     kernel linker script only contains a single NOTE segment:
> > > 
> > > /DISCARD/ : { *(.note.gnu.property) }
> > > 
> > > is placed before
> > > 
> > > .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
> > >  {
> > >   __rela_dyn_start = .;
> > >   *(.rela*) <<<<<<<< Keep .rela* sections
> > >  }
> > > 
> > > Then .rela* in
> > > 
> > >  /DISCARD/ : {
> > >   *(*.EMB.apuinfo)
> > >   *(.glink .iplt .plt .rela* .comment)
> > >   *(.gnu.version*)
> > >   *(.gnu.attributes)
> > >   *(.eh_frame)
> > >  }
> > > 
> > > is honored.  Can someone from POWERPC comment on it?
> > 
> > Hmm OK. I'm not really a toolchain person.
> > 
> > The comment on DISCARDS says:
> > 
> >    * Some archs want to discard exit text/data at runtime rather than
> >    * link time due to cross-section references such as alt instructions,
> >    * bug table, eh_frame, etc.  DISCARDS must be the last of output
> >    * section definitions so that such archs put those in earlier section
> >    * definitions.
> >    */
> > 
> > But I guess you're changing those semantics in your series.
> > 
> > This seems to fix the warning for me?
> > 
> > diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> > index b4c89a1acebb..076b3e8a849d 100644
> > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > @@ -365,9 +365,12 @@ SECTIONS
> >         DISCARDS
> >         /DISCARD/ : {
> >                 *(*.EMB.apuinfo)
> > -               *(.glink .iplt .plt .rela* .comment)
> > +               *(.glink .iplt .plt .comment)
> >                 *(.gnu.version*)
> >                 *(.gnu.attributes)
> >                 *(.eh_frame)
> > +#ifndef CONFIG_RELOCATABLE
> > +               *(.rela*)
> > +#endif
> >         }
> >  }
> > 
> > 
> > cheers
> 
> This looks correct me.
> 
> Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
> 
> Thanks.
> 

Has this been merged into any branch yet?  I just checked the tip tree and did
not see it.

Thanks,
Yu-cheng

