Return-Path: <linuxppc-dev+bounces-3026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F39C1288
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 00:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkz6d1w2tz3bmY;
	Fri,  8 Nov 2024 10:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731022729;
	cv=none; b=fO87z8x/wFnH8kTiUmjluSUrtUg4Lv+Y2iBqFtSIKnewAFaEucQmsiBaODj0f5JYphgv7OWl0m1+Hlo0nYs5J+EOUbbv2KwL83ktd7RbNgZ/JxLtxt1nXexbNmjEnhBwDB35mj3g2SPAPpeE78WAd8PmDHVVGqNYWOn9ZUqgVQBSo50z0ZGeYw4puNhmBYLfYoJPRbllPmskTG06qeN3uJue+0NQPnhpMXsOdUuLRyK4L4P5IU9FabioZLgGY7CBMF8xaXqLrY/7EEy/MqgY+aCO/UewZ45fu0P91GpauI1U94j1UQa7UtJP68LAsZ/OjYB2B19ri6iXvHt7k8YT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731022729; c=relaxed/relaxed;
	bh=ZzWkR0GOngNSUwjx4cfHDpPa+S6pHkHSoGBdXkewqpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OcTajRgpvEAwb2oY2sRAxZTdOToGxzZYa7a/oADdpJhaHIp2sMDSsYSCTJ72nbxIJxtHzt0pDMT2iK5PD4i1mMy6bQKsuUl4pHsLECe2zb3pvc1+ehtk+RciNHjz82lZDcliVv61bpqBn3+HfQM7is98cSx3axoLO3u9cIaDv8DQcpt1faNTr0G/dKsDsNFL6jn8FZUUNOPM3YYFpsN8gcXEDBkOOsu3jlTXUHF8+DonLHv8wbRI1leA0rh1+PXuNWbO/lM3f7PW/eFvkRc+bxvb16lpRvaqI9BZ9L2ByF9i9PufO9XDH9c4+fWEVpPPYP199bb6xYGswyZFsROmjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TUPLNbxo; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TUPLNbxo;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkz6Z2TH7z2yVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 10:38:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731022716;
	bh=ZzWkR0GOngNSUwjx4cfHDpPa+S6pHkHSoGBdXkewqpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TUPLNbxonwdujxVvjGiB9u3JX5yMx2bSI7r2PEI3wl/8STSxyFRJiaJSul3H3+OE6
	 D/ETUYjuL9vVMb8LqpIL0LoYs5VWEo4oQ2BHEoahj5KKLxrEjOWM1dOJvjXEh3grXR
	 o5Gk7Dh1/LczHZ2usP5wjNpFYgahMsd+0vkBMkW2lYc1EupHChirwWYnYDv4vLH55v
	 FWXirblpQpd8nS3UAqaZo10sKqHusY56PQ1LoiJJavzCNu8Eqb8EGMedkdCzP+hZ7U
	 qkigV4cA5xgodFFf6+jSY5R4+5eCCKkYlpVdKuV4NqZb3yTlY4846cd44BLwIx3g+S
	 BIs8M7u9+SJOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkz6N35JYz4wcy;
	Fri,  8 Nov 2024 10:38:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc/pseries: Fix KVM guest detection for
 disabling hardlockup detector
In-Reply-To: <2kkln3emctf7ewsh3eysujid2e7jel7yjtscfxmqeymeo5bjxf@7yzi5eye2n5j>
References: <20241105132734.499506-1-gautam@linux.ibm.com>
 <87ed3ncl8q.fsf@mpe.ellerman.id.au>
 <2kkln3emctf7ewsh3eysujid2e7jel7yjtscfxmqeymeo5bjxf@7yzi5eye2n5j>
Date: Fri, 08 Nov 2024 10:38:36 +1100
Message-ID: <87bjyqd37n.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Gautam Menghani <gautam@linux.ibm.com> writes:
> On Thu, Nov 07, 2024 at 10:54:29PM +1100, Michael Ellerman wrote:
>> Gautam Menghani <gautam@linux.ibm.com> writes:
>> > As per the kernel documentation[1], hardlockup detector should be
>> > disabled in KVM guests as it may give false positives. On PPC, hardlockup
>> > detector is broken inside KVM guests because disable_hardlockup_detector()
>>  
>> Isn't it the opposite? Inside KVM guests, the hardlockup detector should
>> be *disabled*, but it's not it's *enabled*, due to this bug.
>> 
>> ie. it's not broken, it's working, but that's the bug.
>
> Yes right, will change the description in v2.

Thanks.

>> > is marked as early_initcall and it uses is_kvm_guest(), which is
>> > initialized by check_kvm_guest() later during boot as it is a
>> > core_initcall. check_kvm_guest() is also called in pSeries_smp_probe(),
>> > which is called before initcalls, but it is skipped if KVM guest does
>> > not have doorbell support or if the guest is launched with SMT=1.
>> 
>> I'm wondering how no one has noticed. Most KVM guests have SMT=1.
>
> Looking at the commit history, code around hardlockups and
> pSeries_smp_probe() was changed around 2021/2022 timeframe, and I
> believe KVM wasn't being actively tested at the time. 
> Even I noticed this only after coming across the documentation that said
> hardlockups should be disabled. So probably this feature decision isn't
> widely known.

I do test KVM but probably not under enough load to notice something
like that.

>> > Move the check_kvm_guest() call in pSeries_smp_probe() to the initial
>> > part of function before doorbell/SMT checks so that "kvm_guest" static
>> > key is initialized by the time disable_hardlockup_detector() runs.
>> 
>> check_kvm_guest() is safe to be called multiple times so
>> disable_hardlockup_detector() should just call it before it calls
>> is_kvm_guest(). That should avoid future breakage when the order of
>> calls changes, or someone refactors pSeries_smp_probe().
>
> Yeah I did that initially but in the worst case, that results in 3 calls
> to check_kvm_guest() - the core_initcall, pseries_smp_probe() call and 
> then disable_hardlockup_detector(). Will that be fine?

Yeah it's fine. It's not pretty, maybe we can come up with something
cleaner in future, but it's fine for a bug fix.

cheers

