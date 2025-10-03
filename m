Return-Path: <linuxppc-dev+bounces-12662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E80BB81AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 22:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdgHy5C7kz3d97;
	Sat,  4 Oct 2025 06:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.71.208.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759523374;
	cv=none; b=ZYHHy3JeeCWg/5qYNn+Q5Czzs0gmceptzfBoKwUqFBShHr+buLbQJVbkMld78b1l0Lzv7dKRQXLfwtLw2wn6i37/mhaQAjy3Jd9xND4o5JHi1ZmDWhcKhQDXApDDbMa8gv27484v4+CXKueS08suaLQQyIVYdO72Qswry47LSlnVFSma9En4Ye5gezwYhwEROt1cC4rATU62Feuk97rzWiDMoXO03HQbf4AXSHKBPq7NcErTZhpYBfYqyb/J1bZhtnGb8E5DoXfetj4aRDoha/BlDYlVP5+rMy3tEltymnNgTJvNw3E47DKSK0XBNs0AOMTDtGaRk9X10Mm+C/sXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759523374; c=relaxed/relaxed;
	bh=ZSiozYL9av6/yqYZ1ojB886S7qQBNu1kIdF3OOFiSt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRuWkKU6t9+bF2MFJEh4RUsJ3eVaiB56XmMwMwbOeqM7hLGgv1rQGXSllDfiIjfulwnAAFfyTHda5M8GKLXWP/DYolEhnuU6mZGTi1XhzalRGD5u5+UMOUb1uHsXWiPzO64cT4VCWG9iYtg7Zgc+lh+K8pMZzVDW3MmjBcxTrDaLKip8hobZkADoOT6R09pK+EnUDahnkBjeod1hmMtEFBZrIQr2KnCvCR4b8dSQq3NlvNBB3yHjD2YcPsTPvwXJP/cmuPg1ynbENziBpTRd3wJPLomt6/1nJKJ6b478HziflDNzDrsMxTkmu9GVPFxioya/2OLlHR9RBvKfPqxAVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bell.net; dkim=pass (2048-bit key; unprotected) header.d=bell.net header.i=@bell.net header.a=rsa-sha256 header.s=selector1 header.b=oDxyBSak; dkim-atps=neutral; spf=pass (client-ip=209.71.208.11; helo=cmx-mtlrgo001.bell.net; envelope-from=dave.anglin@bell.net; receiver=lists.ozlabs.org) smtp.mailfrom=bell.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bell.net header.i=@bell.net header.a=rsa-sha256 header.s=selector1 header.b=oDxyBSak;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bell.net (client-ip=209.71.208.11; helo=cmx-mtlrgo001.bell.net; envelope-from=dave.anglin@bell.net; receiver=lists.ozlabs.org)
Received: from cmx-mtlrgo001.bell.net (mta-mtl-001.bell.net [209.71.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdgHw2jkXz3d8R
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 06:29:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1759523372; 
        bh=ZSiozYL9av6/yqYZ1ojB886S7qQBNu1kIdF3OOFiSt4=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=oDxyBSakQGBk3UxMi89oM7j67sIFlpmAHNWrrncZJT7OVyzbze1Iw+OEaP0ThqLc8Bb7Ni0G4PIpQi+455hShmDkGsGS/p//CqfaTv5OKx+i2WShIWwReR75uZC9ZuJz0Ywk5j4jFMltYUZpYthccon0SgNwNW3dT3oK/53cYGQmF+zxC3MEfnsRuHftv2IV17kq/XTWobTyoSiS5z++6irxc2vrn8EI4YlWFj/0a0baM6Tu4SvWixWYdsLCdgm5Gn6+KUMtGjOSAFIDKh//nEnj2mqgDEpUftVFkMHnDBtzAOOveccbdiZgQi0G2WbNrIvvTo74QWmVFdXKjPiEUg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-Originating-IP: [142.126.189.246]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 68C1701503F87783
X-RazorGate-Vade: dmFkZTFAVSVH3SiUOFRgEpdKbxkygZJRN+wjQ3+7JLA/aHxHSm5i7/PF4mTBT8WtBn7+lxiMRPYLKXtCf7iS9x+McIrTICRECzSEsBDDmX0g+rXi4ctSksWPFcfviRm+PotPodUreZwFE6frq9b/vZEWb9zohQp8N7b1TBIv581R6bMFc3aRYEoBuh6XFu7wQcCcbyctvLBQ9AekV97lK3DUxQ9tGcTDjh44Ei8XDzNWZYGLXru/OXuyyVa7U035NNK7XE/UT2nBkRYYlTzUefAExYdm5r1AjIdGXoCVmMdRppQMDACxagJbItn+DPkJkK1D0uasAZcsSUoBAyFDdObcd9rbrkK+4MlJQXN6niRN7ztkec65gQWM7JFKddfdKIVZMsOdle3RXVrmEbYnkuZw+ClrPLYlsCYCGLNnzy9/eHGWmdlSKWKykBjq3V3P/imMdsohjOWPsu3FAU7N961cqrCS6BAleJcJRZ7cZRqO1xwU6qJPWAk1eKkeK2KmEypOTyHDN/P+DrdGdY/zckiNfWcrY1QB9SoGB7IFYrdtE99hVyEjkzjAzm/yGBJlaP3J8IBYWqFZyPtHFt6E+Ch59FlmNbZ+3GPApsc7p/7XvSOS82tfG4hA2Bu9MDLbD+hvLd4FUqQUBf0W5NH3gX5MPaP17NoqnnFOR1XFqkNnFwFm0g
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.49] (142.126.189.246) by cmx-mtlrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 68C1701503F87783; Fri, 3 Oct 2025 16:28:45 -0400
Message-ID: <45e1dff3-aff1-4a41-ab24-6eddf6171e3a@bell.net>
Date: Fri, 3 Oct 2025 16:28:45 -0400
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leonro@nvidia.com>, Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Magnus Lindholm <linmag7@gmail.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
 <610b10bc-1aa2-4fad-a40b-be5fcfa04430@bell.net>
 <20251003172618.GJ3360665@nvidia.com>
From: John David Anglin <dave.anglin@bell.net>
Content-Language: en-US
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <20251003172618.GJ3360665@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-03 1:26 p.m., Jason Gunthorpe wrote:
> On Fri, Oct 03, 2025 at 01:18:32PM -0400, John David Anglin wrote:
>> On 2025-10-03 11:01 a.m., Jason Gunthorpe wrote:
>>> This doesn't actually use the virt at all:
>>>
>>> 	offset = ((unsigned long) addr) & ~IOVP_MASK;
>>> 	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
>>> 		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
>>>
>>> And ccio_io_pdir_entry():
>>> 	pa = lpa(vba);
>>>
>>> Is a special instruction that uses virt but AI tells me that special
>>> LPA instruction is returning phys. Not sure if that is a different
>>> value than virt_to_phys()..
>>
>> ccio_io_pdir_entry currently only supports KERNEL_SPACE.  For KERNEL_SPACE, lpa() and
>> virt_to_phys() are equivalent if page is mapped.  lpa() returns 0 if a non-access data
>> TLB fault occurs (i.e., page isn't mapped).  Not sure if that
>> matters.
> 
> After unfolding everything the expression is
> 
>   lpa(phys_to_virt(pa))
> 
> So if that is always equal to pa then lets just drop it.

If lpa() was replaced by virt_to_phys(), the result would always be equal to pa.  So, I think it
can be dropped.

Dave
-- 
John David Anglin  dave.anglin@bell.net

