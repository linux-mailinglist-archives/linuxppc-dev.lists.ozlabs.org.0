Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8745318EFAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:09:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m3qq2XzxzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:09:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m3m21qKfzDqjy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:06:10 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N63WfE076512
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:06:07 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywd8ax1bp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:06:06 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 06:06:04 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 06:06:01 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02N660Ag32571790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 06:06:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C27D1A406B;
 Mon, 23 Mar 2020 06:06:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F179CA4057;
 Mon, 23 Mar 2020 06:05:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.48.63])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 06:05:58 +0000 (GMT)
Subject: Re: [PATCH v4 02/16] xmon: Move out-of-line instructions to text
 section
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200320051809.24332-3-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-3-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 11:29:42 +0530
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032306-0012-0000-0000-000003960146
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032306-0013-0000-0000-000021D2F028
Message-Id: <f32395e83068538851152c7cf1c7f53856c47d74.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_01:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=869 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230037
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

Can it separate commits ?
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
#define BPT_OFFSET(off, bp_word_off) ((off - bp_word_off) / 				BPT_WOR
DS_SIZE);
:::
:::
:::
bp_word_off = off % BPT_WORDS_SIZE;
if (bp_word_off != 0 && bp_word_off != 4)
        return NULL;
*offp = bp_word_off;
return bpts + BPT_OFFSET(off, bp_word_off);

-- Bala
>  }
 
 static struct bpt *new_breakpoint(unsigned long a)
@@ -876,7
> +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp
> = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled &&
> atomic_read(&bp->ref_count) == 0) {
 			bp->address =
> a;
-			patch_instruction(&bp->instr[1], bpinstr);
+	
> 		bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
+	
> 		patch_instruction(bp->instr + 1, bpinstr);
 		
> 	return bp;
 		}
 	}

