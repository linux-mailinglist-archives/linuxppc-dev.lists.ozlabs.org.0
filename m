Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C51573D933F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 18:31:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZfLb5Crzz3clD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 02:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.233;
 helo=out03.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1245 seconds by postgrey-1.36 at boromir;
 Thu, 29 Jul 2021 02:31:13 AEST
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZfL94hvwz30Bm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 02:31:13 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51]:43296)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1m8m8j-00HGYH-Fq; Wed, 28 Jul 2021 10:10:37 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:41390
 helo=email.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1m8m8a-00AA3v-G4; Wed, 28 Jul 2021 10:10:31 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Arnd Bergmann <arnd@kernel.org>
References: <20210727144859.4150043-1-arnd@kernel.org>
 <20210727144859.4150043-3-arnd@kernel.org>
Date: Wed, 28 Jul 2021 11:10:20 -0500
In-Reply-To: <20210727144859.4150043-3-arnd@kernel.org> (Arnd Bergmann's
 message of "Tue, 27 Jul 2021 16:48:55 +0200")
Message-ID: <87a6m6fmhf.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m8m8a-00AA3v-G4; ; ; mid=<87a6m6fmhf.fsf@disp2133>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX18jESHy/qa/BMuMj4KVyetONWlkP5WqcQ8=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa04.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 XMGappySubj_01,XM_B_SpammyWords autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.5 XMGappySubj_01 Very gappy subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa04 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
X-Spam-DCC: XMission; sa04 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Arnd Bergmann <arnd@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 616 ms - load_scoreonly_sql: 0.07 (0.0%),
 signal_user_changed: 12 (1.9%), b_tie_ro: 10 (1.6%), parse: 1.48
 (0.2%), extract_message_metadata: 27 (4.3%), get_uri_detail_list: 4.8
 (0.8%), tests_pri_-1000: 46 (7.5%), tests_pri_-950: 1.27 (0.2%),
 tests_pri_-900: 1.07 (0.2%), tests_pri_-90: 105 (17.0%), check_bayes:
 102 (16.6%), b_tokenize: 16 (2.6%), b_tok_get_all: 12 (1.9%),
 b_comp_prob: 2.7 (0.4%), b_tok_touch_all: 68 (11.0%), b_finish: 1.19
 (0.2%), tests_pri_0: 410 (66.6%), check_dkim_signature: 0.62 (0.1%),
 check_dkim_adsp: 2.7 (0.4%), poll_dns_idle: 0.75 (0.1%), tests_pri_10:
 2.1 (0.3%), tests_pri_500: 7 (1.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v5 2/6] kexec: avoid compat_alloc_user_space
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
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
Cc: Feng Tang <feng.tang@intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> kimage_alloc_init() expects a __user pointer, so compat_sys_kexec_load()
> uses compat_alloc_user_space() to convert the layout and put it back
> onto the user space caller stack.
>
> Moving the user space access into the syscall handler directly actually
> makes the code simpler, as the conversion for compat mode can now be
> done on kernel memory.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Co-developed-by: Eric Biederman <ebiederm@xmission.com>
> Co-developed-by: Christoph Hellwig <hch@infradead.org>
> Link: https://lore.kernel.org/lkml/YPbtsU4GX6PL7%2F42@infradead.org/
> Link: https://lore.kernel.org/lkml/m1y2cbzmnw.fsf@fess.ebiederm.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/kexec.c | 61 +++++++++++++++++++++-----------------------------
>  1 file changed, 25 insertions(+), 36 deletions(-)
>
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index 9c7aef8f4bb6..b5e40f069768 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -19,26 +19,9 @@
>  
>  #include "kexec_internal.h"
>  
> -static int copy_user_segment_list(struct kimage *image,
> -				  unsigned long nr_segments,
> -				  struct kexec_segment __user *segments)
> -{
> -	int ret;
> -	size_t segment_bytes;
> -
> -	/* Read in the segments */
> -	image->nr_segments = nr_segments;
> -	segment_bytes = nr_segments * sizeof(*segments);
> -	ret = copy_from_user(image->segment, segments, segment_bytes);
> -	if (ret)
> -		ret = -EFAULT;
> -
> -	return ret;
> -}
> -
>  static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
>  			     unsigned long nr_segments,
> -			     struct kexec_segment __user *segments,
> +			     struct kexec_segment *segments,
>  			     unsigned long flags)
>  {
>  	int ret;
> @@ -58,10 +41,8 @@ static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
>  		return -ENOMEM;
>  
>  	image->start = entry;
> -
> -	ret = copy_user_segment_list(image, nr_segments, segments);
> -	if (ret)
> -		goto out_free_image;
> +	image->nr_segments = nr_segments;
> +	memcpy(image->segment, segments, nr_segments * sizeof(*segments));
>  
>  	if (kexec_on_panic) {
>  		/* Enable special crash kernel control page alloc policy. */
> @@ -104,7 +85,7 @@ static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
>  }
>  
>  static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> -		struct kexec_segment __user *segments, unsigned long flags)
> +		struct kexec_segment *segments, unsigned long flags)
>  {
>  	struct kimage **dest_image, *image;
>  	unsigned long i;
> @@ -250,7 +231,8 @@ static inline int kexec_load_check(unsigned long nr_segments,
>  SYSCALL_DEFINE4(kexec_load, unsigned long, entry, unsigned long, nr_segments,
>  		struct kexec_segment __user *, segments, unsigned long, flags)
>  {
> -	int result;
> +	struct kexec_segment *ksegments;
> +	unsigned long result;
>  
>  	result = kexec_load_check(nr_segments, flags);
>  	if (result)
> @@ -261,7 +243,12 @@ SYSCALL_DEFINE4(kexec_load, unsigned long, entry, unsigned long, nr_segments,
>  		((flags & KEXEC_ARCH_MASK) != KEXEC_ARCH_DEFAULT))
>  		return -EINVAL;
>  
> -	result = do_kexec_load(entry, nr_segments, segments, flags);
> +	ksegments = memdup_user(segments, nr_segments * sizeof(ksegments[0]));
> +	if (IS_ERR(ksegments))
> +		return PTR_ERR(ksegments);
> +
> +	result = do_kexec_load(entry, nr_segments, ksegments, flags);
> +	kfree(ksegments);
>  
>  	return result;
>  }
> @@ -273,7 +260,7 @@ COMPAT_SYSCALL_DEFINE4(kexec_load, compat_ulong_t, entry,
>  		       compat_ulong_t, flags)
>  {
>  	struct compat_kexec_segment in;
> -	struct kexec_segment out, __user *ksegments;
> +	struct kexec_segment *ksegments;
>  	unsigned long i, result;
>  
>  	result = kexec_load_check(nr_segments, flags);
> @@ -286,24 +273,26 @@ COMPAT_SYSCALL_DEFINE4(kexec_load, compat_ulong_t, entry,
>  	if ((flags & KEXEC_ARCH_MASK) == KEXEC_ARCH_DEFAULT)
>  		return -EINVAL;
>  
> -	ksegments = compat_alloc_user_space(nr_segments * sizeof(out));
> +	ksegments = kmalloc_array(nr_segments, sizeof(ksegments[0]),
> +			GFP_KERNEL);
> +	if (!ksegments)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < nr_segments; i++) {
>  		result = copy_from_user(&in, &segments[i], sizeof(in));
>  		if (result)
> -			return -EFAULT;
> +			goto fail;
>  
> -		out.buf   = compat_ptr(in.buf);
> -		out.bufsz = in.bufsz;
> -		out.mem   = in.mem;
> -		out.memsz = in.memsz;
> -
> -		result = copy_to_user(&ksegments[i], &out, sizeof(out));
> -		if (result)
> -			return -EFAULT;
> +		ksegments[i].buf   = compat_ptr(in.buf);
> +		ksegments[i].bufsz = in.bufsz;
> +		ksegments[i].mem   = in.mem;
> +		ksegments[i].memsz = in.memsz;
>  	}
>  
>  	result = do_kexec_load(entry, nr_segments, ksegments, flags);
>  
> +fail:
> +	kfree(ksegments);
>  	return result;
>  }
>  #endif
