Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E161F576C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 17:14:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hr9r38R6zDqLR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 01:14:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=f5BnCBdf; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hr7K1ptQzDq99
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 01:11:56 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id l12so2964192ejn.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpLVcpUgoShg/1XmdrA7+06VlUnO5aUWJK3XavqBXDw=;
 b=f5BnCBdf4PM+delyIxrdfUQcONOsDcd1Mwzj17IshNZ4GcVV4fvUTZRBKAKi2QLAyr
 1XL984LbMj5bQ3GCOHZWVc9lVitbfrt8uwhnm5UBVe5ipplb+oxgu+kg/9YrJN2b35I2
 VmmLTSBBJnmIA8UEtbdSLZh1tJXxKuVUjfnLN3s7s2KGtd8c8vWSu35o3O8ohv+28zT7
 kqJpfZwauYCw36xJ8nz38lvMmnjM9xy33h72Hgd/qkyT1OBnk5hkVPWcpR+XV4wa3BJR
 1c7hb5O9a5OhJp6x0YehpenyFtKbMBeV8tPVrE0h2zosbyItEhq7qxXevfQMJniGH/4z
 oQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpLVcpUgoShg/1XmdrA7+06VlUnO5aUWJK3XavqBXDw=;
 b=QeNVllnESEJD9miMXDu7K53lR4bq8FI0bn3OYUn4J+kRdSLM27KtNc6Lwgdn6GfrXh
 abYo/9kJkEL+dlMIWr6iVethZj+N+EJCwl3QVXrAzTUlIKJlGfN4b2/U19MMMIR6Sdb4
 sbHLnSQkvmp8Gk8n4W3E6hjk1hIhJCW9jdMGqJxIvWFLg/HR2BovG0fZfqTHHm6c6elB
 h4hmuHwy7LgdS/G89TeZ7GChOSSox7H7kQgQ/56nXeGeOzc6lq/K4qPQgyeJXGzPSe9i
 tVNyK7q98m+ABj+3wvA1ywmAC2BmHweadvj/u4q9+GU/8AcrzFrDXPaaSN3BetfNbIYj
 wgtQ==
X-Gm-Message-State: AOAM531NmbJRndvpeSH3tBovaap3rLfNFZxLEQrsvVWL1aZSq54xF/19
 vj0739uQCuFywwnVoQYSFSEUwRiIzIdrmFRZvmPgRg==
X-Google-Smtp-Source: ABdhPJwScnLJtCFfAG60dt1Shm2haI4ZhjrwDbGzGW2nLrhzCW9NkE82J1uytD1U/55BNt3enMSmxIExt0XVpWaPd1o=
X-Received: by 2002:a17:906:22d0:: with SMTP id
 q16mr3729067eja.455.1591801909256; 
 Wed, 10 Jun 2020 08:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200607131339.476036-6-vaibhav@linux.ibm.com>
 <202006090059.o4CE5D9b%lkp@intel.com>
 <CAPcyv4iQo_xgRGPx_j+RPzgWGZaigGRbc_kRzKEFePfVHenx5g@mail.gmail.com>
 <87mu5cw2gl.fsf@linux.ibm.com>
 <CAPcyv4jfeBoFCdg2sKP5ExpTTQ_+LyrJewTupcrTgh-qWykNxw@mail.gmail.com>
 <87k10fw29r.fsf@linux.ibm.com>
In-Reply-To: <87k10fw29r.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 10 Jun 2020 08:11:37 -0700
Message-ID: <CAPcyv4h_0qSqS2P0=vNk9KWy-=WZq-giNupks+Q0+wmYVt9iLA@mail.gmail.com>
Subject: Re: [PATCH v11 5/6] ndctl/papr_scm, uapi: Add support for PAPR nvdimm
 specific methods
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Santosh Sivaraj <santosh@fossix.org>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 10, 2020 at 5:10 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Tue, Jun 9, 2020 at 10:54 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
> >>
> >> Thanks Dan for the consideration and taking time to look into this.
> >>
> >> My responses below:
> >>
> >> Dan Williams <dan.j.williams@intel.com> writes:
> >>
> >> > On Mon, Jun 8, 2020 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
> >> >>
> >> >> Hi Vaibhav,
> >> >>
> >> >> Thank you for the patch! Perhaps something to improve:
> >> >>
> >> >> [auto build test WARNING on powerpc/next]
> >> >> [also build test WARNING on linus/master v5.7 next-20200605]
> >> >> [cannot apply to linux-nvdimm/libnvdimm-for-next scottwood/next]
> >> >> [if your patch is applied to the wrong git tree, please drop us a note to help
> >> >> improve the system. BTW, we also suggest to use '--base' option to specify the
> >> >> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >> >>
> >> >> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Jain/powerpc-papr_scm-Add-support-for-reporting-nvdimm-health/20200607-211653
> >> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> >> >> config: powerpc-randconfig-r016-20200607 (attached as .config)
> >> >> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e429cffd4f228f70c1d9df0e5d77c08590dd9766)
> >> >> reproduce (this is a W=1 build):
> >> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >> >>         chmod +x ~/bin/make.cross
> >> >>         # install powerpc cross compiling tool for clang build
> >> >>         # apt-get install binutils-powerpc-linux-gnu
> >> >>         # save the attached .config to linux build tree
> >> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc
> >> >>
> >> >> If you fix the issue, kindly add following tag as appropriate
> >> >> Reported-by: kernel test robot <lkp@intel.com>
> >> >>
> >> >> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >> >>
> >> >> In file included from <built-in>:1:
> >> >> >> ./usr/include/asm/papr_pdsm.h:69:20: warning: field 'hdr' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >> >> struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */
> >> >
> >> > Hi Vaibhav,
> >> >
> >> [.]
> >> > This looks like it's going to need another round to get this fixed. I
> >> > don't think 'struct nd_pdsm_cmd_pkg' should embed a definition of
> >> > 'struct nd_cmd_pkg'. An instance of 'struct nd_cmd_pkg' carries a
> >> > payload that is the 'pdsm' specifics. As the code has it now it's
> >> > defined as a superset of 'struct nd_cmd_pkg' and the compiler warning
> >> > is pointing out a real 'struct' organization problem.
> >> >
> >> > Given the soak time needed in -next after the code is finalized this
> >> > there's no time to do another round of updates and still make the v5.8
> >> > merge window.
> >>
> >> Agreed that this looks bad, a solution will probably need some more
> >> review cycles resulting in this series missing the merge window.
> >>
> >> I am investigating into the possible solutions for this reported issue
> >> and made few observations:
> >>
> >> I see command pkg for Intel, Hpe, Msft and Hyperv families using a
> >> similar layout of embedding nd_cmd_pkg at the head of the
> >> command-pkg. struct nd_pdsm_cmd_pkg is following the same pattern.
> >>
> >> struct nd_pdsm_cmd_pkg {
> >>     struct nd_cmd_pkg hdr;
> >>     /* other members */
> >> };
> >>
> >> struct ndn_pkg_msft {
> >>     struct nd_cmd_pkg gen;
> >>     /* other members */
> >> };
> >> struct nd_pkg_intel {
> >>     struct nd_cmd_pkg gen;
> >>     /* other members */
> >> };
> >> struct ndn_pkg_hpe1 {
> >>     struct nd_cmd_pkg gen;
> >>     /* other members */
> [.]
> >
> > In those cases the other members are a union and there is no second
> > variable length array. Perhaps that is why those definitions are not
> > getting flagged? I'm not seeing anything in ndctl build options that
> > would explicitly disable this warning, but I'm not sure if the ndctl
> > build environment is missing this build warning by accident.
>
> I tried building ndctl master with clang-10 with CC=clang and
> CFLAGS="". Seeing the same warning messages reported for all command
> package struct for existing command families.
>
> ./hpe1.h:334:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>         struct nd_cmd_pkg gen;
>                           ^
> ./msft.h:59:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>         struct nd_cmd_pkg       gen;
>                                 ^
> ./hyperv.h:34:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>         struct nd_cmd_pkg       gen;
>                                 ^

Good to know, but ugh now I'm just realizing this warning is only
coming from clang and not gcc. Frankly I'm not as concerned about
clang warnings and I should have been more careful looking at the
source of this warning.

> >
> > Those variable size payloads are also not being used in any code paths
> > that would look at the size of the command payload, like the kernel
> > ioctl() path. The payload validation code needs static sizes and the
> > payload parsing code wants to cast the payload to a known type. I
> > don't think you can use the same struct definition for both those
> > cases which is why the ndctl parsing code uses the union layout, but
> > the kernel command marshaling code does strict layering.
> Even if I switch to union layout and replacing the flexible array 'payload'
> at end to a fixed size array something like below, I still see
> '-Wgnu-variable-sized-type-not-at-end' warning reported by clang:
>
> union nd_pdsm_cmd_payload {
>         struct nd_papr_pdsm_health health;
>         __u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
> };
>
> struct nd_pdsm_cmd_pkg {
>         struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */
>         __s32 cmd_status;       /* Out: Sub-cmd status returned back */
>         __u16 reserved[2];      /* Ignored and to be used in future */
>         union nd_pdsm_cmd_payload payload;
> } __attribute__((packed));

Even though this is a clang warning, I'm still not sure it's a good
idea to copy the ndctl approach into the kernel. Could you perhaps
handle this the way that drivers/acpi/nfit/intel.c handles submitting
commands through the ND_CMD_CALL interface, i.e. by just defining the
command locally like this (from intel_security_flags()):

        struct {
                struct nd_cmd_pkg pkg;
                struct nd_intel_get_security_state cmd;
        } nd_cmd = {
                .pkg = {
                        .nd_command = NVDIMM_INTEL_GET_SECURITY_STATE,
                        .nd_family = NVDIMM_FAMILY_INTEL,
                        .nd_size_out =
                                sizeof(struct nd_intel_get_security_state),
                        .nd_fw_size =
                                sizeof(struct nd_intel_get_security_state),
                },
        };

That way it's clear that the payload is 'struct
nd_intel_get_security_state' without needing to have a pre-existing
definition. For parsing in the ioctl path I think it's clearer to cast
the payload to the local pdsm structure for the command.

>
>
> >
> >> };
> >>
> >> Even though other command families implement similar command-package
> >> layout they were not flagged (yet) as they are (I am guessing) serviced
> >> in vendor acpi drivers rather than in kernel like in case of papr-scm
> >> command family.
> >
> > I sincerely hope there are no vendor acpi kernel drivers outside of
> > the upstream one.
> Apologies if I was not clear. Was referring to nvdimm vendor uefi
> drivers which ultimately service the DSM commands. Since CMD_CALL serves
> as a conduit to send the command payload to these vendor drivers,
> libnvdimm never needs to peek into the nd_cmd_pkg.payload
> field. Consequently nfit module never hit this warning in kernel before.

Ah, understood, and no, that's not the root reason this problem is not
present in the kernel. The expectation is that any payload that the
kernel would need to consider should probably have a kernel specific
translation defined. For example,

        ND_CMD_GET_CONFIG_SIZE
        ND_CMD_GET_CONFIG_DATA
        ND_CMD_SET_CONFIG_DATA

...are payloads that the kernel needs to understand. However instead
of supporting each way to read / write the label area the expectation
is that all drivers just parse this common kernel payload and
translate it if necessary. For example ND_CMD_{GET,SET}_CONFIG_DATA is
optionally translated to the Intel DSMs, generic ACPI _LSR/_LSW, or
papr_scm_meta_{get,set}.

Outside of validating command numbers the expectation is that the
kernel does not validate/consume the contents of the ND_CMD_CALL
payload, it passes it to the backend where ACPI DSM or pdsm protocol
takes over.

>
> >
> >>
> >> So, I think this issue is not just specific to papr-scm command family
> >> introduced in this patch series but rather across all other command
> >> families. Every other command family assumes 'struct nd_cmd_pkg_hdr' to
> >> be embeddable and puts it at the beginning of their corresponding
> >> command-packages. And its only a matter of time when someone tries
> >> filtering/handling of vendor specific commands in nfit module when they
> >> hit similar issue.
> >>
> >> Possible Solutions:
> >>
> >> * One way would be to redefine 'struct nd_cmd_pkg' to mark field
> >>   'nd_payload[]' from a flexible array to zero sized array as
> >>   'nd_payload[0]'.
> >
> > I just went through a round of removing the usage of buf[0] in ndctl
> > since gcc10 now warns about that too.
> >
> >> This should make 'struct nd_cmd_pkg' embeddable and
> >>   clang shouldn't report 'gnu-variable-sized-type-not-at-end'
> >>   warning. Also I think this change shouldn't introduce any ABI change.
> >>
> >> * Another way to solve this issue might be to redefine 'struct
> >>   nd_pdsm_cmd_pkg' to below removing the 'struct nd_cmd_pkg' member. This
> >>   struct should immediately follow the 'struct nd_cmd_pkg' command package
> >>   when sent to libnvdimm:
> >>
> >>   struct nd_pdsm_cmd_pkg {
> >>         __s32 cmd_status;       /* Out: Sub-cmd status returned back */
> >>         __u16 reserved[2];      /* Ignored and to be used in future */
> >>         __u8 payload[];
> >>         };
> >>
> >>   This should remove the flexible member nc_cmd_pkg.nd_payload from the
> >>   struct with just one remaining at the end. However this would make
> >>   accessing the [in|out|fw]_size members of 'struct nd_cmd_pkg'
> >>   difficult for the pdsm servicing functions.
> >>
> >>
> >> Any other solution that you think, may solve this issue ?
> >
> > The union might help, but per the above I think only for parsing the
> > command at which point I don't think the kernel needs a unified
> > structure defining both the generic envelope and the end-point
> > specific payload at once.
>
> As I tested above, switching to union too will not solve the clang
> warning.
>
> Having a unified structure for a command family defining both
> generic envelop and end-point specific payload, is what I see all the
> existing command families doing.
>
> However if I split 'struct nd_pdsm_cmd_pkg' to not have an embedded
> 'struct nd_cmd_pkg' then it goes opposite to what existing command family
> implementations.
>
> So to me it looks like no clear way to address this :-(
>
> Another non-conventional way to fix this might be to suppress this clang
> warning messages by adding "CFLAGS_papr_scm.o +=
> -Wno-gnu-variable-sized-type-not-at-end" to papr_scm Makefile.

No, I don't think it's appropriate to customize clang warnings. Have a
look at splitting parsing vs local command submission following the
approach taken in drivers/acpi/nfit/intel.c.

> Current implementation 'struct nd_cmd_pkg' clearly depends on gcc
> extension of having a flexible payload array which is allowed to be not
> necessarily placed at the end of a containing struct. So the problem can be
> attributed to difference in compiler implementations between GCC and
> Clang rather than how 'struct nd_pdsm_cmd_pkg' and 'struct nd_cmd_pkg'
> are laid out.
>
> --
> Cheers
> ~ Vaibhav
