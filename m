Return-Path: <linuxppc-dev+bounces-17900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKhVDyzOrmnEIwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:42:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C28239E68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:42:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTyqD0vJdz3bnm;
	Tue, 10 Mar 2026 00:42:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773063720;
	cv=none; b=R41ePYyjvawcBeeDvK783VfWcfRm/bagEmOPnZzD59eOczWKmcNlmLcgcu5+ykyk8fCven016M0Vy11MxIKwwV21/6EdTtdcNzVotROE5jDifhwqCZImNIqgXhiUzSofuDz/psleY0E+b97Znx5th7109nRqD9CGHN2C0NalRfw795ruvWH2reukWYbceWni/AloO86HdaUT5/WXgMPNN37BuAifmr4B0VR742utZVo9BCAkjqP+ToP0xzNuny2giuz6P6kGuYWiySpVLV+hGG2BsPsGi2efTCFcHw2A9POX3WoONKKD8Z6Ot9TP3ajb0NI81ysz0cMnzJWs9CbojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773063720; c=relaxed/relaxed;
	bh=1GLUDDBgVxepWfAs2Z57KYNMaqAUDpdP/rkJm6W1Yc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKfLTHme7TNTanF+XiN6lNuzzHB6VkQ+pI9rqHjpGG3YnWNHkE8Ye/A/7+y7hQzM3TsMS6Amh2RSO5Uep79+J9F89gU0zUhfTB3VTbNpF/h+NINcwJ2eayz0ybi+MCxOUmnY8JvO/YD6wKm9LoPcCNb2tnRS4aB35U3u48Hb1cHd+G+5PVDiOkr0WDeaTZE7pK7kEYT1Q65T0zYdSCqCghq/vI1amqTWYyX9brJEA2VJd0jWupahgYScBLTLwv4uVUpAHjbZboZOT8qL8IlnXzoHvV2IVr2kCyglLeV6c9D82caRfz03qf9Fg7j4B1NGOjRYD9QQ8iwtgKP/mTzxAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SS3qFN7Q; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SS3qFN7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTyqB6xYZz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 00:41:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13F0960130;
	Mon,  9 Mar 2026 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A309C4CEF7;
	Mon,  9 Mar 2026 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773063715;
	bh=UoUbL95Q4+tSbCtlerVmISNzgIu9HYD6KL01bp1lHXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SS3qFN7Q0Vb6c7hMStjg2G4fQsxATczuRLFp2+E9luZ8z3HUWiFITLQ/PcT9t3nti
	 vrdM9DoYVbqdenkvgAePk4EimHqj8r0simCmFNk8jX202vhWStXUCx/YleD75oJ4lr
	 rCAS0QYc1ocxeaClYLtp2UyBbon6K5QUlwm3AauPOBCiXALALNcMlyi2d1Nf/b7Kfw
	 X/asaAXJSjtc6q9voMpnwngtqxaS/vOZCCbx7h2NqqiqsEwfA8Pn8UVjonEK6OwA7C
	 2G5z0gNjgvypfYcWHuJOfjaWpRsuWl5WLN+9OVlxB6yZ2469XVPHZIYL97BIOqzI1C
	 Fb2vKUPO8JBxg==
Date: Mon, 9 Mar 2026 13:41:51 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/4] mm: move vma_kernel_pagesize() from hugetlb to
 mm.h
Message-ID: <d8cdf99b-3139-49b5-bc4f-dda139856021@lucifer.local>
References: <20260306101600.57355-1-david@kernel.org>
 <20260306101600.57355-2-david@kernel.org>
 <833950ef-e01d-4914-b5f9-bc1f6261b184@lucifer.local>
 <729e14d4-6949-4d46-9380-12331b5ad363@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <729e14d4-6949-4d46-9380-12331b5ad363@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 32C28239E68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17900-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lucifer.local:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:25:51PM +0100, David Hildenbrand (Arm) wrote:
> On 3/6/26 12:07, Lorenzo Stoakes (Oracle) wrote:
> > On Fri, Mar 06, 2026 at 11:15:57AM +0100, David Hildenbrand (Arm) wrote:
> >> In the past, only hugetlb had special "vma_kernel_pagesize()"
> >> requirements, so it provided its own implementation.
> >>
> >> In commit 05ea88608d4e ("mm, hugetlbfs: introduce ->pagesize() to
> >> vm_operations_struct") we generalized that approach by providing a
> >> vm_ops->pagesize() callback to be used by device-dax.
> >>
> >> Once device-dax started using that callback in commit c1d53b92b95c
> >> ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
> >> it was missed that CONFIG_DEV_DAX does not depend on hugetlb support.
> >>
> >> So building a kernel with CONFIG_DEV_DAX but without CONFIG_HUGETLBFS
> >> would not pick up that value.
> >>
> >> Fix it by moving vma_kernel_pagesize() to mm.h, providing only a single
> >> implementation. While at it, improve the kerneldoc a bit.
> >>
> >> Ideally, we'd move vma_mmu_pagesize() as well to the header. However,
> >> its __weak symbol might be overwritten by a PPC variant in hugetlb code.
> >> So let's leave it in there for now, as it really only matters for some
> >> hugetlb oddities.
> >>
> >> This was found by code inspection.
> >>
> >> Fixes: c1d53b92b95c ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > LGTM, but you need to fix up VMA tests, I attach a patch below to do this. Will
> > this resolved:
>
> Thanks!
>
> I assume that should go into patch #2 instead?
>
> >
> > Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
>
>
> [...]
>
> > ---
> >  tools/testing/vma/include/dup.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
> > index 3078ff1487d3..65b1030a7fdf 100644
> > --- a/tools/testing/vma/include/dup.h
> > +++ b/tools/testing/vma/include/dup.h
> > @@ -1318,3 +1318,10 @@ static inline void vma_set_file(struct vm_area_struct *vma, struct file *file)
> >  	swap(vma->vm_file, file);
> >  	fput(file);
> >  }
> > +
> > +static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
> > +{
> > +	if (unlikely(vma->vm_ops && vma->vm_ops->pagesize))
> > +		return vma->vm_ops->pagesize(vma);
> > +	return PAGE_SIZE;
>
> Should we just KIS and use PAGE_SIZE for the test?

Yeah that's fine, but then should go in tools/testing/vma/include/custom.h :>)

I tidied things up there to make it easier to understand WTH is going on with
the headers used by VMA tests.

>
> --
> Cheers,
>
> David

Thanks, Lorenzo

