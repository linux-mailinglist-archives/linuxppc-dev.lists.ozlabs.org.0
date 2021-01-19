Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF712FBD8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:28:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKwbY23MfzDqx4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 04:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=A3TBUaI4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tmd+C37l; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKwYT5xgdzDqyP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 04:26:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611077174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAzpHVdlnMaDyvxGTKzMDyi59keeJ2kOytyejQDWyqg=;
 b=A3TBUaI40AOAUFrkN/5HW9PVF17Ua7uAwz0L/GOItz2ko8k4oGl+ErH65vh2/U3rfuWfIO
 2mUn3UyHl6e18BemLqrCi9QrqJDKojuTK76aA4t+PWLKNq6PYtn0vMaQnTKf3XxcZoereo
 FCwy/XVemOliGRb+NdkwpTrWVHkYWuw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611077175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAzpHVdlnMaDyvxGTKzMDyi59keeJ2kOytyejQDWyqg=;
 b=Tmd+C37lin2uvhOfSYvesO6v22bF1T/JWWafoCivLs2LVQyJ6c4W5D/0Y599gLyLirwLdS
 Kssw83pIzBUh807iL2OwvjtC+Cswq9V8ik6DFwL0AyDJssoacG5QHQL+xJHWJiTsnjFEYD
 CN43kn7AQt8Nz3QHfh7IszGVNxEbFC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-AXabtRcgOPCQB4xr3nWivg-1; Tue, 19 Jan 2021 12:26:10 -0500
X-MC-Unique: AXabtRcgOPCQB4xr3nWivg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3CF01936B8A;
 Tue, 19 Jan 2021 17:26:07 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.194.45])
 by smtp.corp.redhat.com (Postfix) with SMTP id 0C6A260C9C;
 Tue, 19 Jan 2021 17:26:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Tue, 19 Jan 2021 18:26:07 +0100 (CET)
Date: Tue, 19 Jan 2021 18:26:03 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] powerpc/uprobes: Don't allow probe on suffix of prefixed
 instruction
Message-ID: <20210119172603.GA16696@redhat.com>
References: <20210119091234.76317-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119091234.76317-1-ravi.bangoria@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org, paulus@samba.org,
 sandipan@linux.ibm.com, jniethe5@gmail.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/19, Ravi Bangoria wrote:
>
> Probe on 2nd word of a prefixed instruction is invalid scenario and
> should be restricted.

I don't understand this ppc-specific problem, but...

> +#ifdef CONFIG_PPC64
> +int arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr,
> +			      uprobe_opcode_t opcode)
> +{
> +	uprobe_opcode_t prefix;
> +	void *kaddr;
> +	struct ppc_inst inst;
> +
> +	/* Don't check if vaddr is pointing to the beginning of page */
> +	if (!(vaddr & ~PAGE_MASK))
> +		return 0;

So the fix is incomplete? Or insn at the start of page can't be prefixed?

> +int __weak arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr,
> +				     uprobe_opcode_t opcode)
> +{
> +	return 0;
> +}
> +
>  static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t *new_opcode)
>  {
>  	uprobe_opcode_t old_opcode;
> @@ -275,6 +281,8 @@ static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t
>  	if (is_swbp_insn(new_opcode)) {
>  		if (is_swbp)		/* register: already installed? */
>  			return 0;
> +		if (arch_uprobe_verify_opcode(page, vaddr, old_opcode))
> +			return -EINVAL;

Well, this doesn't look good...

To me it would be better to change the prepare_uprobe() path to copy
the potential prefix into uprobe->arch and check ppc_inst_prefixed()
in arch_uprobe_analyze_insn(). What do you think?

Oleg.

