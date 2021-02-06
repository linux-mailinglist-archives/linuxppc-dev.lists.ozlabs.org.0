Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01E311F45
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 19:08:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DY0f22XZYzDvbF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 05:08:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jEsf3S4L; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEsf3S4L; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DY0bF6XxMzDvVk
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 05:06:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612634773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3K/ORZIshWIeyzZP4aoxZMdX04y5DfgexQ64BWXU8Y=;
 b=jEsf3S4LG2P/SINojbxkUZG7h5zPHLijVla47fWeo5rg1QRkXiHmmi/q9J7JaM94qzzpwC
 5JweSlBYbpEKLcayDrnc9TLcKfXrJ4t761ViIBlhoNirJLAByzaNMXU1wUgjMk5NlB9iQ9
 BRp6YsthZrkx+y1E5oYLpfJB7Us/g1s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612634773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3K/ORZIshWIeyzZP4aoxZMdX04y5DfgexQ64BWXU8Y=;
 b=jEsf3S4LG2P/SINojbxkUZG7h5zPHLijVla47fWeo5rg1QRkXiHmmi/q9J7JaM94qzzpwC
 5JweSlBYbpEKLcayDrnc9TLcKfXrJ4t761ViIBlhoNirJLAByzaNMXU1wUgjMk5NlB9iQ9
 BRp6YsthZrkx+y1E5oYLpfJB7Us/g1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-9Li4jnmTPJ-OOFFjEqd1hQ-1; Sat, 06 Feb 2021 13:06:11 -0500
X-MC-Unique: 9Li4jnmTPJ-OOFFjEqd1hQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25DE5107ACC7;
 Sat,  6 Feb 2021 18:06:09 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.37])
 by smtp.corp.redhat.com (Postfix) with SMTP id 43FA257;
 Sat,  6 Feb 2021 18:06:06 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sat,  6 Feb 2021 19:06:08 +0100 (CET)
Date: Sat, 6 Feb 2021 19:06:05 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
Message-ID: <20210206180604.GA8897@redhat.com>
References: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On 02/04, Ravi Bangoria wrote:
>
> +static int get_instr(struct mm_struct *mm, unsigned long addr, u32 *instr)
> +{
> +	struct page *page;
> +	struct vm_area_struct *vma;
> +	void *kaddr;
> +	unsigned int gup_flags = FOLL_FORCE | FOLL_SPLIT_PMD;
> +
> +	if (get_user_pages_remote(mm, addr, 1, gup_flags, &page, &vma, NULL) <= 0)
> +		return -EINVAL;

"vma" is not used, and I don't think you need FOLL_SPLIT_PMD.

Otherwise I can't really comment this ppc-specific change.

To be honest, I don't even understand why do we need this fix. Sure, the
breakpoint in the middle of 64-bit insn won't work, why do we care? The
user should know what does he do.

Not to mention we can't really trust get_user_pages() in that this page
can be modified by mm owner or debugger...

But I won't argue.

Oleg.

