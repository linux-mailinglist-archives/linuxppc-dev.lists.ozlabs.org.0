Return-Path: <linuxppc-dev+bounces-14669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8C5CA9FDA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 06 Dec 2025 04:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNZ0c5vZcz2xQK;
	Sat, 06 Dec 2025 14:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764992768;
	cv=none; b=PwwdKsD0Hzlm2zRrXQO8Q5Jwh1OVMdGcaiOMeU8NdyaSRAxpTHO3aoCm0geh8qxOp5Ba+wUiTCjzM/vxWJ+qa9kJz/eW/MRuszlMIjOlZ9KdrE1UiWMc0/iF4Kc8APS/546NpK6sDIyakXSZyEfj6E51WIitJaI/rNg8kPCpx1sn7VbQMO8d4vwLr8HmM/gCrjqqYSJht1J63yfcCprtkd80PggidsESWmhq7l/h8xgzqaEQL46A+i99L7Vel0Y43nGH480Dv6m0HEauo+7L6JE9NHF4uMXYnlSmZVlmo+aaYJe0awLt3ZJx8GTAMA3vyJHApL8rCbKwuXHsk39mgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764992768; c=relaxed/relaxed;
	bh=KoD1NRD0QaV+f74bc5iSUT0wwYVNJpat/RcP0vQRNuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dri3G5AFxlhriTJuDGQT5AnlZuMqI+g8vS6POVY6K7em7FZplF8tAndnhPq75OgedmsqgbET4sWOy5Y/N2Bh+IEJJpyKiIlYOM0NzndLe8216sMNPzaf32JkEwHVOC8w8KGy4RjSzglJiJGn+gitOneuHe2MigiQMZMTTQ++bT63iOR1tL4S+7N6HGxv/7XvDG3FwXMtuO+D0boBmEskokz9QPP/MlNOusVh2iJL0qyg6RafaZYTWi5gtJSt3H2tjjEhxAuUQbesaT0AolV5HbDfSGOHHCKH/+SuGXtx46fLCJbqLan/BOPGc953oKVT2KXJPHyUmErp8vIX0wVT4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=coIeJHot; dkim-atps=neutral; spf=pass (client-ip=44.202.169.35; helo=omta036.useast.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org) smtp.mailfrom=embeddedor.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=coIeJHot;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=44.202.169.35; helo=omta036.useast.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 339 seconds by postgrey-1.37 at boromir; Sat, 06 Dec 2025 14:46:02 AEDT
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNZ0V2kjlz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 14:46:01 +1100 (AEDT)
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id RdqOvFYSJKXDJRj8Bv35kM; Sat, 06 Dec 2025 03:38:47 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Rj8AvLQt6cu11Rj8Avic2K; Sat, 06 Dec 2025 03:38:46 +0000
X-Authority-Analysis: v=2.4 cv=bKYWIO+Z c=1 sm=1 tr=0 ts=6933a546
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=ujWNxKVE5dX343uAl30YYw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=_lKBnUPEwlkEFLTacEwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KoD1NRD0QaV+f74bc5iSUT0wwYVNJpat/RcP0vQRNuI=; b=coIeJHotksEB6dU0JU8LIyi2+L
	uaDb55h2Mt1UuG3h/KfXxkyCM9kNkUWFXfKhHQ4o8JDSD7EQAoRXlQNhy2MPsqj9G6CEDFz/Atw+9
	ZgQjnWppwz+a1nyxKyA8oa3XON37XtoLsHEsqBF7NciO4/cTYHyJsaGDdkZ1q96dXAR3vN+Ajgd8E
	26oVQjWOBLooorvXiIFmWbm5h0W8vYG/Im+2W7ub8NiQ1hVB5GfsOo4OHyrJbTvh1tDzKIt53tiIR
	QYbVpumaH0gvsFCV4zcXTBdq2yPsnMuu7hmsfqp+jYwJ4mvpvuF9UPJnj4fcmmFTX5nHWOJenYOGa
	9yhq7lSQ==;
Received: from i118-18-233-1.s41.a027.ap.plala.or.jp ([118.18.233.1]:61266 helo=[10.83.24.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vRj86-00000002EOT-2JGv;
	Fri, 05 Dec 2025 21:38:43 -0600
Message-ID: <0018d1c0-58ec-4b31-b016-472795990923@embeddedor.com>
Date: Sat, 6 Dec 2025 12:38:14 +0900
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
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>
References: <20251205232655.445294-1-seanjc@google.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 118.18.233.1
X-Source-L: No
X-Exim-ID: 1vRj86-00000002EOT-2JGv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: i118-18-233-1.s41.a027.ap.plala.or.jp ([10.83.24.44]) [118.18.233.1]:61266
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEdZQdtWfJVa5qONViHKKv4i+eLGXgZAeOmc+OzorTf6m7FcBUOcNsM3XR9OuRC0zCPbakqKpEfdjQ3+WjafPJKn9cKSzGI7OchCeiRcSR2L91Nc+rH5
 KoiwmhUjxohbGV1Cd/48SGvFw+FEmmQoC02fHwxhfrpPU7DUvYs0ztMvgyUv109xR5F3nMcbL/Cr9FHSJplq9DYlRnLADRoC4q4Q7QqNM3/ka07kKvguj+l4
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/6/25 08:26, Sean Christopherson wrote:
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.

Nice. Thanks for this.

> 
> Opportunistically clean up the indentation for the stats macros, and
> replace spaces with tabs.
> 
> No functional change intended.
> 
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Closes: https://lore.kernel.org/all/aPfNKRpLfhmhYqfP@kspp
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Gustavo A. R. Silva <gustavoars@kernel.org>

-Gustavo

