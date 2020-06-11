Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B411F6D2A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 20:05:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jWwj3LpqzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 04:05:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jWtw2XmmzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 04:03:35 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BHsjUs019173; Thu, 11 Jun 2020 14:03:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kse8g6ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 14:03:28 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05BHtCiA019920;
 Thu, 11 Jun 2020 14:03:27 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kse8g6sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 14:03:27 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05BHbK8E013626;
 Thu, 11 Jun 2020 18:03:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 31g2s8223d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 18:03:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05BI27s3459492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jun 2020 18:02:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6FF04204B;
 Thu, 11 Jun 2020 18:03:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 850E842041;
 Thu, 11 Jun 2020 18:03:20 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.86.168])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 11 Jun 2020 18:03:20 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Thu, 11 Jun 2020 23:33:19 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v11 5/6] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
In-Reply-To: <CAPcyv4h_0qSqS2P0=vNk9KWy-=WZq-giNupks+Q0+wmYVt9iLA@mail.gmail.com>
References: <20200607131339.476036-6-vaibhav@linux.ibm.com>
 <202006090059.o4CE5D9b%lkp@intel.com>
 <CAPcyv4iQo_xgRGPx_j+RPzgWGZaigGRbc_kRzKEFePfVHenx5g@mail.gmail.com>
 <87mu5cw2gl.fsf@linux.ibm.com>
 <CAPcyv4jfeBoFCdg2sKP5ExpTTQ_+LyrJewTupcrTgh-qWykNxw@mail.gmail.com>
 <87k10fw29r.fsf@linux.ibm.com>
 <CAPcyv4h_0qSqS2P0=vNk9KWy-=WZq-giNupks+Q0+wmYVt9iLA@mail.gmail.com>
Date: Thu, 11 Jun 2020 23:33:19 +0530
Message-ID: <87h7vhwkd4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_18:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006110139
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Wed, Jun 10, 2020 at 5:10 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>
>> > On Tue, Jun 9, 2020 at 10:54 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>> >>
>> >> Thanks Dan for the consideration and taking time to look into this.
>> >>
>> >> My responses below:
>> >>
>> >> Dan Williams <dan.j.williams@intel.com> writes:
>> >>
>> >> > On Mon, Jun 8, 2020 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
>> >> >>
>> >> >> Hi Vaibhav,
>> >> >>
>> >> >> Thank you for the patch! Perhaps something to improve:
>> >> >>
>> >> >> [auto build test WARNING on powerpc/next]
>> >> >> [also build test WARNING on linus/master v5.7 next-20200605]
>> >> >> [cannot apply to linux-nvdimm/libnvdimm-for-next scottwood/next]
>> >> >> [if your patch is applied to the wrong git tree, please drop us a note to help
>> >> >> improve the system. BTW, we also suggest to use '--base' option to specify the
>> >> >> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>> >> >>
>> >> >> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Jain/powerpc-papr_scm-Add-support-for-reporting-nvdimm-health/20200607-211653
>> >> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
>> >> >> config: powerpc-randconfig-r016-20200607 (attached as .config)
>> >> >> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e429cffd4f228f70c1d9df0e5d77c08590dd9766)
>> >> >> reproduce (this is a W=1 build):
>> >> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>> >> >>         chmod +x ~/bin/make.cross
>> >> >>         # install powerpc cross compiling tool for clang build
>> >> >>         # apt-get install binutils-powerpc-linux-gnu
>> >> >>         # save the attached .config to linux build tree
>> >> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc
>> >> >>
>> >> >> If you fix the issue, kindly add following tag as appropriate
>> >> >> Reported-by: kernel test robot <lkp@intel.com>
>> >> >>
>> >> >> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>> >> >>
>> >> >> In file included from <built-in>:1:
>> >> >> >> ./usr/include/asm/papr_pdsm.h:69:20: warning: field 'hdr' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>> >> >> struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */
>> >> >
>> >> > Hi Vaibhav,
>> >> >
>> >> [.]
>> >> > This looks like it's going to need another round to get this fixed. I
>> >> > don't think 'struct nd_pdsm_cmd_pkg' should embed a definition of
>> >> > 'struct nd_cmd_pkg'. An instance of 'struct nd_cmd_pkg' carries a
>> >> > payload that is the 'pdsm' specifics. As the code has it now it's
>> >> > defined as a superset of 'struct nd_cmd_pkg' and the compiler warning
>> >> > is pointing out a real 'struct' organization problem.
>> >> >
>> >> > Given the soak time needed in -next after the code is finalized this
>> >> > there's no time to do another round of updates and still make the v5.8
>> >> > merge window.
>> >>
>> >> Agreed that this looks bad, a solution will probably need some more
>> >> review cycles resulting in this series missing the merge window.
>> >>
>> >> I am investigating into the possible solutions for this reported issue
>> >> and made few observations:
>> >>
>> >> I see command pkg for Intel, Hpe, Msft and Hyperv families using a
>> >> similar layout of embedding nd_cmd_pkg at the head of the
>> >> command-pkg. struct nd_pdsm_cmd_pkg is following the same pattern.
>> >>
>> >> struct nd_pdsm_cmd_pkg {
>> >>     struct nd_cmd_pkg hdr;
>> >>     /* other members */
>> >> };
>> >>
>> >> struct ndn_pkg_msft {
>> >>     struct nd_cmd_pkg gen;
>> >>     /* other members */
>> >> };
>> >> struct nd_pkg_intel {
>> >>     struct nd_cmd_pkg gen;
>> >>     /* other members */
>> >> };
>> >> struct ndn_pkg_hpe1 {
>> >>     struct nd_cmd_pkg gen;
>> >>     /* other members */
>> [.]
>> >
>> > In those cases the other members are a union and there is no second
>> > variable length array. Perhaps that is why those definitions are not
>> > getting flagged? I'm not seeing anything in ndctl build options that
>> > would explicitly disable this warning, but I'm not sure if the ndctl
>> > build environment is missing this build warning by accident.
>>
>> I tried building ndctl master with clang-10 with CC=clang and
>> CFLAGS="". Seeing the same warning messages reported for all command
>> package struct for existing command families.
>>
>> ./hpe1.h:334:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>>         struct nd_cmd_pkg gen;
>>                           ^
>> ./msft.h:59:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>>         struct nd_cmd_pkg       gen;
>>                                 ^
>> ./hyperv.h:34:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>>         struct nd_cmd_pkg       gen;
>>                                 ^
>
[.]
> Good to know, but ugh now I'm just realizing this warning is only
> coming from clang and not gcc. Frankly I'm not as concerned about
> clang warnings and I should have been more careful looking at the
> source of this warning.
Thanks for acknowledging this.

I digged deeper into this today and it seems that with clang, kernel code
is compiled with diagnostic flag '-Wno-gnu' [1][2] which implicitly implies
'-Wno-gnu-variable-sized-type-not-at-end'. Hence the structures with
flexible arrays not the end of containing struct are not flagged in
kernel code.

[1] https://github.com/torvalds/linux/blob/b29482fde649c72441d5478a4ea2c52c56d97a5e/Makefile#L788
[2] https://clang.llvm.org/docs/DiagnosticsReference.html#wgnu

However this dignostic flag is not used for uapi header test hence
build robot emmited this warning while trying to test compile
'papr_pdsm.h' uapi header.

>
>> >
>> > Those variable size payloads are also not being used in any code paths
>> > that would look at the size of the command payload, like the kernel
>> > ioctl() path. The payload validation code needs static sizes and the
>> > payload parsing code wants to cast the payload to a known type. I
>> > don't think you can use the same struct definition for both those
>> > cases which is why the ndctl parsing code uses the union layout, but
>> > the kernel command marshaling code does strict layering.
>> Even if I switch to union layout and replacing the flexible array 'payload'
>> at end to a fixed size array something like below, I still see
>> '-Wgnu-variable-sized-type-not-at-end' warning reported by clang:
>>
>> union nd_pdsm_cmd_payload {
>>         struct nd_papr_pdsm_health health;
>>         __u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
>> };
>>
>> struct nd_pdsm_cmd_pkg {
>>         struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */
>>         __s32 cmd_status;       /* Out: Sub-cmd status returned back */
>>         __u16 reserved[2];      /* Ignored and to be used in future */
>>         union nd_pdsm_cmd_payload payload;
>> } __attribute__((packed));
>
> Even though this is a clang warning, I'm still not sure it's a good
> idea to copy the ndctl approach into the kernel. Could you perhaps
> handle this the way that drivers/acpi/nfit/intel.c handles submitting
> commands through the ND_CMD_CALL interface, i.e. by just defining the
> command locally like this (from intel_security_flags()):
>
>         struct {
>                 struct nd_cmd_pkg pkg;
>                 struct nd_intel_get_security_state cmd;
>         } nd_cmd = {
>                 .pkg = {
>                         .nd_command = NVDIMM_INTEL_GET_SECURITY_STATE,
>                         .nd_family = NVDIMM_FAMILY_INTEL,
>                         .nd_size_out =
>                                 sizeof(struct nd_intel_get_security_state),
>                         .nd_fw_size =
>                                 sizeof(struct nd_intel_get_security_state),
>                 },
>         };
>
> That way it's clear that the payload is 'struct
> nd_intel_get_security_state' without needing to have a pre-existing
> definition. For parsing in the ioctl path I think it's clearer to cast
> the payload to the local pdsm structure for the command.
>
In userspace libndctl code doesnt use '-Wno-gnu' (yet) hence this would
still be reported as a warning. Also for each pdsm I want a consistent
way to report errors back. Above would force me to define a 'status'
field to report error in every pdsm payload struct.

I have two possible solutions to work around the clang and 'status'
field issue:

1. I remove instance of 'struct nd_cmd_pkg' from 'nd_pdsm_cmd_pkg' like
below. This should make the clang warning go away and I still keep the
'cmd_status' field.

struct nd_pdsm_cmd_pkg {
 	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
 	__u16 reserved[2];	/* Ignored and to be used in future */
 	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
} __packed;

When sending CMD_CALL allocate and populate an envelop large enough to
hold generic nd_cmd header, pdsm header and the payload like below:

0             64                72                            255
+------------+-----------------+--------------------------------+
|nd_cmd_pkg  | nd_pdsm_cmd_pkg |    payload                     |
+------------+-----------------+--------------------------------+

pdsm handling code introduced in this patchset already uses helpers to
convert nd_cmd_pkg -> nd_pdsm_cmd_pkg and nd_pdsm_cmd_pkg -> payload. So
the impact to the patchset should be contained to these helper
functions. There are places in pdsm service functions that directly
access members of nd_cmd_pkg which may need some tweaking.


2. I open-code members of 'struct nd_cmd_pkg' at start of 'struct
nd_pdsm_cmd_pkg' except the nd_payload field like below. This struct
should ensure ABI compatibility with 'struct nd_cmd_pkg'.

struct nd_pdsm_cmd_pkg {
	__u64   nd_family;		/* family of commands */
	__u64   nd_command;
	__u32   nd_size_in;		/* INPUT: size of input args */
	__u32   nd_size_out;		/* INPUT: size of payload */
	__u32   nd_reserved2[9];	/* reserved must be zero */
	__u32   nd_fw_size;		/* OUTPUT: size fw wants to return */
 	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
 	__u16 reserved[2];	/* Ignored and to be used in future */
 	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
 } __packed;

BULD_BUG_ON((sizeof(struct nd_cmd_pkg) + 8) > sizeof(struct nd_pdsm_cmd_pkg))

>>
>>
>> >
>> >> };
>> >>
>> >> Even though other command families implement similar command-package
>> >> layout they were not flagged (yet) as they are (I am guessing) serviced
>> >> in vendor acpi drivers rather than in kernel like in case of papr-scm
>> >> command family.
>> >
>> > I sincerely hope there are no vendor acpi kernel drivers outside of
>> > the upstream one.
>> Apologies if I was not clear. Was referring to nvdimm vendor uefi
>> drivers which ultimately service the DSM commands. Since CMD_CALL serves
>> as a conduit to send the command payload to these vendor drivers,
>> libnvdimm never needs to peek into the nd_cmd_pkg.payload
>> field. Consequently nfit module never hit this warning in kernel before.
>
> Ah, understood, and no, that's not the root reason this problem is not
> present in the kernel. The expectation is that any payload that the
> kernel would need to consider should probably have a kernel specific
> translation defined. For example,
>
>         ND_CMD_GET_CONFIG_SIZE
>         ND_CMD_GET_CONFIG_DATA
>         ND_CMD_SET_CONFIG_DATA
>
> ...are payloads that the kernel needs to understand. However instead
> of supporting each way to read / write the label area the expectation
> is that all drivers just parse this common kernel payload and
> translate it if necessary. For example ND_CMD_{GET,SET}_CONFIG_DATA is
> optionally translated to the Intel DSMs, generic ACPI _LSR/_LSW, or
> papr_scm_meta_{get,set}.
>
> Outside of validating command numbers the expectation is that the
> kernel does not validate/consume the contents of the ND_CMD_CALL
> payload, it passes it to the backend where ACPI DSM or pdsm protocol
> takes over.
Right, but arent those independent IOCTLs to libnvdimm with a fixed
predefined struct thats exchanged with libndctl. Not sure how can that
help with exchanging pdsms with papr_scm that are variable in length and
can only rely on CMD_CALL ioctl.

-- 
Cheers
~ Vaibhav
