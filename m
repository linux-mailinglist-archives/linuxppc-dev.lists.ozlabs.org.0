Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D573046F6F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 23:35:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J984Z4nP6z3cPv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 09:35:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fXFqrXO6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fXFqrXO6; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J983v29bJz2yfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 09:34:49 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id e3so24685854edu.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 14:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e0xWu4FRBdpcPopR+tYuIVQgtChl7uURnH22cFlaA5A=;
 b=fXFqrXO6Mqxbn1VMEeZUPYqwDn0Axi1WQoRKyIm0Wko3qi8To1yhBnzyQBnuuJpvU9
 tR9dyu+xSqUrDMvvahFuENMdiHPMXRJ4o4DKWl7ljy3Mz+Nrt/S+gISbeuWgkR+cEOle
 5HfXVZsTYOn1456X/asYJBDh/+KY3upkcOeEjnBkupzBDml+tuhSKMfrF3aI5eR2H+9m
 AxeYoRDcvdBsZd0n9yd/Xbwhp7Eyc1p3mbosWQ4yNA3IyW8kf/9iawYPt5tkAmOak1+/
 fGSMnJ7WfE0c7M44ExGyn8D0Cv6BJ1MqLcK9O6mLpBWThWXCeEb72RJR4HaLNOYG3YT4
 QWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e0xWu4FRBdpcPopR+tYuIVQgtChl7uURnH22cFlaA5A=;
 b=l0mDe80VkvjpKgxNVzNEJkiF0aOHAOJ1ixe7SyczCNQtt1MDvHllGwfKB8pNYDDoi7
 IMYyqQIf/LKMYwRXPRaPLfwwh9bvAG3YZLXVS3SutNNMVqICC+NyPtazXhcRmg89jZ43
 7upLfEI6PT+sbFG9d7Geo54vbxxPcB/FMwt6xssZyogA7wzumoEREQZg43ZDqwx3skCm
 w1Ok+f2rno0JrXTZ/h5pg32Vlg7M6xr6/nAk2CAFoflxgAOrp6rHVg/xTTz4s9OVcmbq
 XAIrHry6b464psXOaimQ8OMPy2EFtFH3cZY9+Uw76wML6c+6D6TsRjTRPccJANiFP+55
 ohyA==
X-Gm-Message-State: AOAM530p2HV/EcpHW7TmF230gIIE/92Dsyc+ehIc+eZBLwV3X+mpdmxN
 UbcAXnF6qLDVC1SuaDkCvDE=
X-Google-Smtp-Source: ABdhPJyxMeAJrbZymRVBb0iPORoJGZau5fLIvkWo7GHCG5UbZ3oj1yMvqn13BjVbdYGJRifVkBRRAw==
X-Received: by 2002:a17:906:b2c7:: with SMTP id
 cf7mr19483296ejb.303.1639089285134; 
 Thu, 09 Dec 2021 14:34:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id go10sm459347ejc.115.2021.12.09.14.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 14:34:44 -0800 (PST)
Message-ID: <6cb2cd57-16f3-d0ec-adf6-cb8fdcbae035@redhat.com>
Date: Thu, 9 Dec 2021 23:34:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-9-dwmw2@infradead.org>
 <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
 <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/9/21 21:40, David Woodhouse wrote:
> 
> NP, very useful fixes. Thanks. Incremental patch looks like this. It
> passes the xen_shinfo_test self-test; will test it with real Xen guests
> tomorrow and repost based on your kvm/next tree once it shows up.

Compared to the review it's missing this hunk:


@@ -265,7 +265,7 @@ void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
   
   	gpc->valid = false;
   
-	old_khva = gpc->khva;
+	old_khva = (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
   	old_dirty = gpc->dirty;
   	old_gpa = gpc->gpa;
   	old_pfn = gpc->pfn;

Otherwise looks good, thanks!

Paolo
