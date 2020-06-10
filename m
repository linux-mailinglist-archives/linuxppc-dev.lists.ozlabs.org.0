Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A53671F5452
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 14:12:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hm8R07tvzDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 22:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hm5s1YwxzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 22:10:25 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05AC2aEs005352; Wed, 10 Jun 2020 08:09:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31jgu60qws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 08:09:49 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05AC4Lm8018084;
 Wed, 10 Jun 2020 08:09:49 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31jgu60qw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 08:09:48 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05AC5OJc023043;
 Wed, 10 Jun 2020 12:09:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7yn1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 12:09:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05AC9imF28835878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 12:09:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53E415204E;
 Wed, 10 Jun 2020 12:09:44 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.102.27.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 3769752052;
 Wed, 10 Jun 2020 12:09:37 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Wed, 10 Jun 2020 17:39:36 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v11 5/6] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
In-Reply-To: <CAPcyv4jfeBoFCdg2sKP5ExpTTQ_+LyrJewTupcrTgh-qWykNxw@mail.gmail.com>
References: <20200607131339.476036-6-vaibhav@linux.ibm.com>
 <202006090059.o4CE5D9b%lkp@intel.com>
 <CAPcyv4iQo_xgRGPx_j+RPzgWGZaigGRbc_kRzKEFePfVHenx5g@mail.gmail.com>
 <87mu5cw2gl.fsf@linux.ibm.com>
 <CAPcyv4jfeBoFCdg2sKP5ExpTTQ_+LyrJewTupcrTgh-qWykNxw@mail.gmail.com>
Date: Wed, 10 Jun 2020 17:39:36 +0530
Message-ID: <87k10fw29r.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_07:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 cotscore=-2147483648 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100089
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

Dan Williams <dan.j.williams@intel.com> writes:

> On Tue, Jun 9, 2020 at 10:54 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>>
>> Thanks Dan for the consideration and taking time to look into this.
>>
>> My responses below:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>
>> > On Mon, Jun 8, 2020 at 5:16 PM kernel test robot <lkp@intel.com> wrote:
>> >>
>> >> Hi Vaibhav,
>> >>
>> >> Thank you for the patch! Perhaps something to improve:
>> >>
>> >> [auto build test WARNING on powerpc/next]
>> >> [also build test WARNING on linus/master v5.7 next-20200605]
>> >> [cannot apply to linux-nvdimm/libnvdimm-for-next scottwood/next]
>> >> [if your patch is applied to the wrong git tree, please drop us a note to help
>> >> improve the system. BTW, we also suggest to use '--base' option to specify the
>> >> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>> >>
>> >> url:    https://github.com/0day-ci/linux/commits/Vaibhav-Jain/powerpc-papr_scm-Add-support-for-reporting-nvdimm-health/20200607-211653
>> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
>> >> config: powerpc-randconfig-r016-20200607 (attached as .config)
>> >> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e429cffd4f228f70c1d9df0e5d77c08590dd9766)
>> >> reproduce (this is a W=1 build):
>> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>> >>         chmod +x ~/bin/make.cross
>> >>         # install powerpc cross compiling tool for clang build
>> >>         # apt-get install binutils-powerpc-linux-gnu
>> >>         # save the attached .config to linux build tree
>> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc
>> >>
>> >> If you fix the issue, kindly add following tag as appropriate
>> >> Reported-by: kernel test robot <lkp@intel.com>
>> >>
>> >> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>> >>
>> >> In file included from <built-in>:1:
>> >> >> ./usr/include/asm/papr_pdsm.h:69:20: warning: field 'hdr' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>> >> struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */
>> >
>> > Hi Vaibhav,
>> >
>> [.]
>> > This looks like it's going to need another round to get this fixed. I
>> > don't think 'struct nd_pdsm_cmd_pkg' should embed a definition of
>> > 'struct nd_cmd_pkg'. An instance of 'struct nd_cmd_pkg' carries a
>> > payload that is the 'pdsm' specifics. As the code has it now it's
>> > defined as a superset of 'struct nd_cmd_pkg' and the compiler warning
>> > is pointing out a real 'struct' organization problem.
>> >
>> > Given the soak time needed in -next after the code is finalized this
>> > there's no time to do another round of updates and still make the v5.8
>> > merge window.
>>
>> Agreed that this looks bad, a solution will probably need some more
>> review cycles resulting in this series missing the merge window.
>>
>> I am investigating into the possible solutions for this reported issue
>> and made few observations:
>>
>> I see command pkg for Intel, Hpe, Msft and Hyperv families using a
>> similar layout of embedding nd_cmd_pkg at the head of the
>> command-pkg. struct nd_pdsm_cmd_pkg is following the same pattern.
>>
>> struct nd_pdsm_cmd_pkg {
>>     struct nd_cmd_pkg hdr;
>>     /* other members */
>> };
>>
>> struct ndn_pkg_msft {
>>     struct nd_cmd_pkg gen;
>>     /* other members */
>> };
>> struct nd_pkg_intel {
>>     struct nd_cmd_pkg gen;
>>     /* other members */
>> };
>> struct ndn_pkg_hpe1 {
>>     struct nd_cmd_pkg gen;
>>     /* other members */
[.]
>
> In those cases the other members are a union and there is no second
> variable length array. Perhaps that is why those definitions are not
> getting flagged? I'm not seeing anything in ndctl build options that
> would explicitly disable this warning, but I'm not sure if the ndctl
> build environment is missing this build warning by accident.

I tried building ndctl master with clang-10 with CC=clang and
CFLAGS="". Seeing the same warning messages reported for all command
package struct for existing command families.

./hpe1.h:334:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
        struct nd_cmd_pkg gen;
                          ^
./msft.h:59:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
        struct nd_cmd_pkg       gen;
                                ^
./hyperv.h:34:20: warning: field 'gen' with variable sized type 'struct nd_cmd_pkg' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
        struct nd_cmd_pkg       gen;
                                ^
>
> Those variable size payloads are also not being used in any code paths
> that would look at the size of the command payload, like the kernel
> ioctl() path. The payload validation code needs static sizes and the
> payload parsing code wants to cast the payload to a known type. I
> don't think you can use the same struct definition for both those
> cases which is why the ndctl parsing code uses the union layout, but
> the kernel command marshaling code does strict layering.
Even if I switch to union layout and replacing the flexible array 'payload'
at end to a fixed size array something like below, I still see
'-Wgnu-variable-sized-type-not-at-end' warning reported by clang:

union nd_pdsm_cmd_payload {
	struct nd_papr_pdsm_health health;
	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
};

struct nd_pdsm_cmd_pkg {
	struct nd_cmd_pkg hdr;	/* Package header containing sub-cmd */
    	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
	__u16 reserved[2];	/* Ignored and to be used in future */
	union nd_pdsm_cmd_payload payload;
} __attribute__((packed));


>
>> };
>>
>> Even though other command families implement similar command-package
>> layout they were not flagged (yet) as they are (I am guessing) serviced
>> in vendor acpi drivers rather than in kernel like in case of papr-scm
>> command family.
>
> I sincerely hope there are no vendor acpi kernel drivers outside of
> the upstream one.
Apologies if I was not clear. Was referring to nvdimm vendor uefi
drivers which ultimately service the DSM commands. Since CMD_CALL serves
as a conduit to send the command payload to these vendor drivers,
libnvdimm never needs to peek into the nd_cmd_pkg.payload
field. Consequently nfit module never hit this warning in kernel before.

>
>>
>> So, I think this issue is not just specific to papr-scm command family
>> introduced in this patch series but rather across all other command
>> families. Every other command family assumes 'struct nd_cmd_pkg_hdr' to
>> be embeddable and puts it at the beginning of their corresponding
>> command-packages. And its only a matter of time when someone tries
>> filtering/handling of vendor specific commands in nfit module when they
>> hit similar issue.
>>
>> Possible Solutions:
>>
>> * One way would be to redefine 'struct nd_cmd_pkg' to mark field
>>   'nd_payload[]' from a flexible array to zero sized array as
>>   'nd_payload[0]'.
>
> I just went through a round of removing the usage of buf[0] in ndctl
> since gcc10 now warns about that too.
>
>> This should make 'struct nd_cmd_pkg' embeddable and
>>   clang shouldn't report 'gnu-variable-sized-type-not-at-end'
>>   warning. Also I think this change shouldn't introduce any ABI change.
>>
>> * Another way to solve this issue might be to redefine 'struct
>>   nd_pdsm_cmd_pkg' to below removing the 'struct nd_cmd_pkg' member. This
>>   struct should immediately follow the 'struct nd_cmd_pkg' command package
>>   when sent to libnvdimm:
>>
>>   struct nd_pdsm_cmd_pkg {
>>         __s32 cmd_status;       /* Out: Sub-cmd status returned back */
>>         __u16 reserved[2];      /* Ignored and to be used in future */
>>         __u8 payload[];
>>         };
>>
>>   This should remove the flexible member nc_cmd_pkg.nd_payload from the
>>   struct with just one remaining at the end. However this would make
>>   accessing the [in|out|fw]_size members of 'struct nd_cmd_pkg'
>>   difficult for the pdsm servicing functions.
>>
>>
>> Any other solution that you think, may solve this issue ?
>
> The union might help, but per the above I think only for parsing the
> command at which point I don't think the kernel needs a unified
> structure defining both the generic envelope and the end-point
> specific payload at once.

As I tested above, switching to union too will not solve the clang
warning.

Having a unified structure for a command family defining both
generic envelop and end-point specific payload, is what I see all the
existing command families doing.

However if I split 'struct nd_pdsm_cmd_pkg' to not have an embedded
'struct nd_cmd_pkg' then it goes opposite to what existing command family
implementations.

So to me it looks like no clear way to address this :-(

Another non-conventional way to fix this might be to suppress this clang
warning messages by adding "CFLAGS_papr_scm.o +=
-Wno-gnu-variable-sized-type-not-at-end" to papr_scm Makefile.

Current implementation 'struct nd_cmd_pkg' clearly depends on gcc
extension of having a flexible payload array which is allowed to be not
necessarily placed at the end of a containing struct. So the problem can be
attributed to difference in compiler implementations between GCC and
Clang rather than how 'struct nd_pdsm_cmd_pkg' and 'struct nd_cmd_pkg'
are laid out.

-- 
Cheers
~ Vaibhav
