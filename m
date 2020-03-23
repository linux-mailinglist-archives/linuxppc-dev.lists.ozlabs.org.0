Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A260618EFA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:07:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m3nh0s9QzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:07:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m3lg5gcczDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:05:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N62l5b014171
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:05:48 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0kub17-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:05:48 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 06:05:45 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 06:05:42 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02N65fw555705680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 06:05:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EFE4AE056;
 Mon, 23 Mar 2020 06:05:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37750AE053;
 Mon, 23 Mar 2020 06:05:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.48.63])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 06:05:38 +0000 (GMT)
Subject: Re: [PATCH v4 02/16] xmon: Move out-of-line instructions to text
 section
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 23 Mar 2020 11:35:37 +0530
In-Reply-To: <20200320051809.24332-3-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-3-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032306-4275-0000-0000-000003B143A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032306-4276-0000-0000-000038C678CF
Message-Id: <2e9df48355d592e1fbeeaff1d19d74c72fc4709f.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_01:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=897 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230033
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
Cc: alistair@popple.id.au, dja@axtens.net, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-20 at 16:17 +1100, Jordan Niethe wrote:
> To execute an instruction out of line after a breakpoint, the NIP is
> set
> to the address of struct bpt::instr. Here a copy of the instruction
> that
> was replaced with a breakpoint is kept, along with a trap so normal
> flow
> can be resumed after XOLing. The struct bpt's are located within the
> data section. This is problematic as the data section may be marked
> as
> no execute.
> 
> Instead of each struct bpt holding the instructions to be XOL'd, make
> a
> new array, bpt_table[], with enough space to hold instructions for
> the
> number of supported breakpoints. Place this array in the text
> section.
> Make struct bpt::instr a pointer to the instructions in bpt_table[]
> associated with that breakpoint. This association is a simple
> mapping:
> bpts[n] -> bpt_table[n * words per breakpoint].

Can we have it in separate commits ?
	* introduce the array bpt_table[] and make struct bpt::instr a 
		pointer to the instructions in bpt_table[].
	* place the array in text section.

> Currently we only need
> the copied instruction followed by a trap, so 2 words per breakpoint.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>  arch/powerpc/kernel/vmlinux.lds.S |  2 +-
>  arch/powerpc/xmon/xmon.c          | 22 +++++++++++++---------
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S
> b/arch/powerpc/kernel/vmlinux.lds.S
> index b4c89a1acebb..e90845b8c300 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -86,7 +86,7 @@ SECTIONS
>  		ALIGN_FUNCTION();
>  #endif
>  		/* careful! __ftr_alt_* sections need to be close to
> .text */
> -		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup
> __ftr_alt_* .ref.text);
> +		*(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup
> __ftr_alt_* .ref.text .text.xmon_bpts);
>  #ifdef CONFIG_PPC64
>  		*(.tramp.ftrace.text);
>  #endif
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 02e3bd62cab4..7875d1a37770 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -97,7 +97,7 @@ static long *xmon_fault_jmp[NR_CPUS];
>  /* Breakpoint stuff */
>  struct bpt {
>  	unsigned long	address;
> -	unsigned int	instr[2];
> +	unsigned int	*instr;
>  	atomic_t	ref_count;
>  	int		enabled;
>  	unsigned long	pad;
> @@ -109,6 +109,7 @@ struct bpt {
>  #define BP_DABR		4
>  
>  #define NBPTS	256
> +#define BPT_WORDS	2
>  static struct bpt bpts[NBPTS];
>  static struct bpt dabr;
>  static struct bpt *iabr;
> @@ -116,6 +117,8 @@ static unsigned bpinstr = 0x7fe00008;	/* trap
> */
>  
>  #define BP_NUM(bp)	((bp) - bpts + 1)
>  
> +static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS *
> BPT_WORDS];
> +
>  /* Prototypes */
>  static int cmds(struct pt_regs *);
>  static int mread(unsigned long, void *, int);
> @@ -852,16 +855,16 @@ static struct bpt *at_breakpoint(unsigned long
> pc)
>  static struct bpt *in_breakpoint_table(unsigned long nip, unsigned
> long *offp)
>  {
>  	unsigned long off;
> +	unsigned long bp_off;
>  
> -	off = nip - (unsigned long) bpts;
> -	if (off >= sizeof(bpts))
> +	off = nip - (unsigned long) bpt_table;
> +	if (off >= sizeof(bpt_table))
>  		return NULL;
> -	off %= sizeof(struct bpt);
> -	if (off != offsetof(struct bpt, instr[0])
> -	    && off != offsetof(struct bpt, instr[1]))
> +	bp_off = off % (sizeof(unsigned int) * BPT_WORDS);
> +	if (bp_off != 0 && bp_off != 4)
>  		return NULL;
> -	*offp = off - offsetof(struct bpt, instr[0]);
> -	return (struct bpt *) (nip - off);
> +	*offp = bp_off;
> +	return bpts + ((off - bp_off) / (sizeof(unsigned int) *
> BPT_WORDS));

`(off - bp_off) / (sizeof(unsigned int) * BPT_WORDS)` seems to be the
actual breakpoint offset. Can we have something like,

#define NBPTS  256
#define BPT_WORDS      2
#define BPT_WORDS_SIZE (sizeof(unsigned int) * BPT_WORDS)
#define BPT_OFFSET(off, bp_word_off) ((off - bp_word_off) / \					BPT_WORDS_SIZE)
;
:::
:::
:::
bp_word_off = off % BPT_WORDS_SIZE;
if (bp_word_off != 0 && bp_word_off != 4)
        return NULL;
*offp = bp_word_off;
return bpts + BPT_OFFSET(off, bp_word_off);

-- Bala

