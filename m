Return-Path: <linuxppc-dev+bounces-12028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E58FB52AF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 10:00:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMqjS1h4qz3bjb;
	Thu, 11 Sep 2025 18:00:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757577612;
	cv=none; b=GAelbfNYncQrJzkYkBagdkNam2zeQoT6I2sGnp7Fzzg4z+St3A4tradZBTRV3hBO6b8Hex+SeTC3VexIn96oy8aKlj8xS1OPEn2iKPInKe97IgeVvhDkETbe4tQiN9yn8WE1lA8y9MTNFngKBiI4VUeIEphFF/QuXTkEsKgiGwCAD1jxkS4lrcLHCKhQBvfYz5dFQfdKHyTZlkou50cuuMdjR1aCgS3rJOOXxYnO7beE4ijR6fuBma2cxfR8latMcaUgfwTSYuz5FdgIMukHzcWtUmToMyrEeQxUVMcZvWM+j01UYh/zQkrCSCRQGlfJmAcm9s2+h8mUbjTSeevvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757577612; c=relaxed/relaxed;
	bh=QrlNksX0kBZBWgevQvqTCUnuhFgrLUFmsGDLIooJuIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZPjDIcE+rrSkdX6V+gER/JZhL0pbOc6MdtYRnLN/UdVZcVGRHk4GLIZJv1QQMv8JIF6dDmSuQ3kN8/NXJW/WmICC30Iwalbr8p6RrbLBzO7U3yivx3bruqeTgfNdFzwzoU5NwO/mQuHyzKF0MbAWHfys4aW/5SWMvNmfhCBE4ijB2Jh0wEgfLH34fDibxiltPv0RMcdlUSlfBpf7MWq3RGW/dMCgcunFiGqAJf7zjp5165i4AGRNGII3TWk9i7VdwDl+NLlKAeZonNZbybz5AMFEuEi1lzxtGDEis5T4o0NkXjYjraGdF/oCkObZ5miRUM1dvaOxii75eWtWNIpcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uk8UhMQ6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Uk8UhMQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMqjQ29nzz30Pl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 18:00:09 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so713678a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757577606; x=1758182406; darn=lists.ozlabs.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QrlNksX0kBZBWgevQvqTCUnuhFgrLUFmsGDLIooJuIw=;
        b=Uk8UhMQ6eRhDliSJRd1SFCe3s4ytkpobTVgFhq/RjD+AfjF8YMhpm7eqRAGKuqaRd1
         0Yws6ldlooJ+zTfE9iv/YjLPWcxLbOCyY0L6ta138pBKGbtGVaqMYZXW4uqgtAnqI5pi
         j102qQBPctGBZDHyaSydo9tGcySe/bpHK9eaHjZw9Fe/T0XEkobcGaLkqNAwR+eEU+Xn
         n6vr0rh4n3QQNBHj1t+DLkY7y4Ve3SrtPBehyrZTyEWXG4xU2h430S22ywsGEj19Hcse
         06JHRQqGqasLEUGeUoPBsB9dsGpAGR5h7v52A5WjqYVZLdn71gYbKZumTsFsrOE+2n/W
         ziaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577606; x=1758182406;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrlNksX0kBZBWgevQvqTCUnuhFgrLUFmsGDLIooJuIw=;
        b=AruKRE+4C6gsOB5AZnezgdQ8LwnWz5LCtlLH+Km4phnSw1+bICJDalCdjCh2p+zDE3
         KpbD4iB/XtuhUnu50Q33rNibF0t8s3wXbbYnlWPr6buAlzMWV4xc05+2hPjLoTYy8KmK
         mR2iJbzZUZXUBbwZ1YImM8+EU+aZlyrT4aqXJRDqIMrOOEIpM86Ue/7s8eIlPhvM0gLX
         lTLgDyldd79JdHO/ui8gag6T+cidNsb8Bo5lhfI1dfDYZF+uGpaNAoiPbt2BSzoJQoDb
         Rn886MwqXq+56+Kd8wt0b3ek3td7l6lJ1JxNOfkB06JOywqWCHi8bH0tztxqjSa7AkOO
         X/4A==
X-Forwarded-Encrypted: i=1; AJvYcCUnNUQqy/yNnrpOBJNfoqvKwnzgJKtPszYlt15C8AtwN1h4PIe60P+zFaqFT/2sXUeuOwWvbeC21LNecH8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yww1rDgeAA0RIjFotFyDagxApU9X9mF2weQweHrVsxBuf+kS+xD
	ND+Vih+C7c0bYQJk464+GMJKia8ojX4ExA4RPOadKjvwb5I0uTsIzU+IcoHHt7tDS9Y=
X-Gm-Gg: ASbGnctzyTFOCD3MUZ2xMQtfxpWOTkgrrwSCc2KU6isnImz2b6u53jBzn4FCo4BYeMI
	B9R0RIFNnKSgXM2+rnbGDxDmhUd8O3Y2/htuxdPqMR22CzSCq2L94G04MIfEsSREFp6DVWrQ4+Q
	KHV0GutKd1ojgOyySXGMBk652xg9gWFYeCa28ZsVk9Kz06DwUue5GBK2bMuqxNU9rhKYvhl+Qga
	G0RAgpqRki97mt+uUh1LqsGKqGWb14Xjjw63In55Hq7mVvFPhjsW/gvq1DqcNuddw87t0uTUnKG
	mOnEBIRkOySUYIxBVOu1xrz/BC/Gd3hiqimwKCm3MQqyuQ6hz8ce9qLRSpR+FZaJPQVwzUxws4w
	RsACADibsDnJ4ueOzWZ6oozfMZg0qg6xxASnS757wMf+CfOmX8uy4Tm7u15CvCfsAJWQ0w2bPAp
	R5i+QQbllc8NtiJUWw8VPboUCnDJxmm9BVvZ5/43dh27YcD3iOXNy8Dqs=
X-Google-Smtp-Source: AGHT+IHtwJP+NpH1ymNM/0dCe30VtYrs+73DFAhA7FZXocgko07f9smiOVMlJT1b7qw2DXXLesjZRA==
X-Received: by 2002:a05:6402:50c8:b0:62e:c525:4f94 with SMTP id 4fb4d7f45d1cf-62ec5255575mr672136a12.32.1757577606313;
        Thu, 11 Sep 2025 01:00:06 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b? (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de. [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec3410ee7sm644477a12.50.2025.09.11.01.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:00:05 -0700 (PDT)
Message-ID: <eb760054-1679-408a-9de9-2505f88382dd@suse.com>
Date: Thu, 11 Sep 2025 10:00:04 +0200
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
Subject: Re: [PATCH 00/14] paravirt: cleanup and reorg
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20250911063433.13783-1-jgross@suse.com>
 <20250911074817.GX3245006@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250911074817.GX3245006@noisy.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qqcArw2UNkNKESBZAhTAYfh4"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qqcArw2UNkNKESBZAhTAYfh4
Content-Type: multipart/mixed; boundary="------------SW0CtEgoDQ04mHi3OOJ80Cxj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <eb760054-1679-408a-9de9-2505f88382dd@suse.com>
Subject: Re: [PATCH 00/14] paravirt: cleanup and reorg
References: <20250911063433.13783-1-jgross@suse.com>
 <20250911074817.GX3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250911074817.GX3245006@noisy.programming.kicks-ass.net>

--------------SW0CtEgoDQ04mHi3OOJ80Cxj
Content-Type: multipart/mixed; boundary="------------uLSRgxz23yDirGsh3b5wzau0"

--------------uLSRgxz23yDirGsh3b5wzau0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDkuMjUgMDk6NDgsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBUaHUsIFNl
cCAxMSwgMjAyNSBhdCAwODozNDoxOUFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gU29tZSBjbGVhbnVwcyBhbmQgcmVvcmcgb2YgcGFyYXZpcnQgY29kZSBhbmQgaGVhZGVy
czoNCj4+DQo+PiAtIFRoZSBmaXJzdCAyIHBhdGNoZXMgc2hvdWxkIGJlIG5vdCBjb250cm92
ZXJzaWFsIGF0IGFsbCwgYXMgdGhleQ0KPj4gICAgcmVtb3ZlIGp1c3Qgc29tZSBubyBsb25n
ZXIgbmVlZGVkICNpbmNsdWRlIGFuZCBzdHJ1Y3QgZm9yd2FyZA0KPj4gICAgZGVjbGFyYXRp
b25zLg0KPj4NCj4+IC0gVGhlIDNyZCBwYXRjaCBpcyByZW1vdmluZyBDT05GSUdfUEFSQVZJ
UlRfREVCVUcsIHdoaWNoIElNTyBoYXMNCj4+ICAgIG5vIHJlYWwgdmFsdWUsIGFzIGl0IGp1
c3QgY2hhbmdlcyBhIGNyYXNoIHRvIGEgQlVHKCkgKHRoZSBzdGFjaw0KPj4gICAgdHJhY2Ug
d2lsbCBiYXNpY2FsbHkgYmUgdGhlIHNhbWUpLiBBcyB0aGUgbWFpbnRhaW5lciBvZiB0aGUg
bWFpbg0KPj4gICAgcGFyYXZpcnQgdXNlciAoWGVuKSBJIGhhdmUgbmV2ZXIgc2VlbiB0aGlz
IGNyYXNoL0JVRygpIHRvIGhhcHBlbi4NCj4+DQo+PiAtIFRoZSA0dGggcGF0Y2ggaXMganVz
dCBhIG1vdmVtZW50IG9mIGNvZGUuDQo+Pg0KPj4gLSBJIGRvbid0IGtub3cgZm9yIHdoYXQg
cmVhc29uIGFzbS9wYXJhdmlydF9hcGlfY2xvY2suaCB3YXMgYWRkZWQsDQo+PiAgICBhcyBh
bGwgYXJjaHMgc3VwcG9ydGluZyBpdCBkbyBpdCBleGFjdGx5IGluIHRoZSBzYW1lIHdheS4g
UGF0Y2gNCj4+ICAgIDUgaXMgcmVtb3ZpbmcgaXQuDQo+Pg0KPj4gLSBQYXRjaGVzIDYtMTIg
YXJlIHN0cmVhbWxpbmluZyB0aGUgcGFyYXZpcnQgY2xvY2sgaW50ZXJmYWNlcyBieQ0KPj4g
ICAgdXNpbmcgYSBjb21tb24gaW1wbGVtZW50YXRpb24gYWNyb3NzIGFyY2hpdGVjdHVyZXMg
d2hlcmUgcG9zc2libGUNCj4+ICAgIGFuZCBieSBtb3ZpbmcgdGhlIHJlbGF0ZWQgY29kZSBp
bnRvIGNvbW1vbiBzY2hlZCBjb2RlLCBhcyB0aGlzIGlzDQo+PiAgICB3aGVyZSBpdCBzaG91
bGQgbGl2ZS4NCj4+DQo+PiAtIFBhdGNoZXMgMTMrMTQgYXJlIG1vcmUgbGlrZSBSRkMgbWF0
ZXJpYWw6IHBhdGNoIDEzIGlzIGRvaW5nIHNvbWUNCj4+ICAgIHByZXBhcmF0aW9uIHdvcmsg
dG8gZW5hYmxlIHBhdGNoIDE0IHRvIG1vdmUgYWxsIHNwaW5sb2NrIHJlbGF0ZWQNCj4+ICAg
IHBhcmF2aXJ0IGZ1bmN0aW9ucyBpbnRvIHFzcGlubG9jay5oLiBJZiB0aGlzIGFwcHJvYWNo
IGlzIGFjY2VwdGVkLA0KPj4gICAgSSdkIGxpa2UgdG8gY29udGludWUgd2l0aCB0aGlzIHdv
cmsgYnkgbW92aW5nIG1vc3QgKG9yIGFsbD8pDQo+PiAgICBwYXJhdmlydCBmdW5jdGlvbnMg
ZnJvbSBwYXJhdmlydC5oIGludG8gdGhlIGhlYWRlcnMgd2hlcmUgdGhlaXINCj4+ICAgIG5h
dGl2ZSBjb3VudGVycGFydHMgYXJlIGRlZmluZWQuIFRoaXMgaXMgbWVhbnQgdG8ga2VlcCB0
aGUgbmF0aXZlDQo+PiAgICBhbmQgcGFyYXZpcnQgZnVuY3Rpb24gZGVmaW5pdGlvbnMgdG9n
ZXRoZXIgaW4gb25lIHBsYWNlIGFuZA0KPj4gICAgaG9wZWZ1bGx5IHRvIGJlIGFibGUgdG8g
cmVkdWNlIHRoZSBpbmNsdWRlIGhlbGwgd2l0aCBwYXJhdmlydC4NCj4+DQo+PiBKdWVyZ2Vu
IEdyb3NzICgxNCk6DQo+PiAgICB4ODYvcGFyYXZpcnQ6IHJlbW92ZSBub3QgbmVlZGVkIGlu
Y2x1ZGVzIG9mIHBhcmF2aXJ0LmgNCj4+ICAgIHg4Ni9wYXJhdmlydDogcmVtb3ZlIHNvbWUg
dW5uZWVkZWQgc3RydWN0IGRlY2xhcmF0aW9ucw0KPj4gICAgeDg2L3BhcmF2aXJ0OiByZW1v
dmUgUEFSQVZJUlRfREVCVUcgY29uZmlnIG9wdGlvbg0KPj4gICAgeDg2L3BhcmF2aXJ0OiBt
b3ZlIHRodW5rIG1hY3JvcyB0byBwYXJhdmlydF90eXBlcy5oDQo+PiAgICBwYXJhdmlydDog
cmVtb3ZlIGFzbS9wYXJhdmlydF9hcGlfY2xvY2suaA0KPj4gICAgc2NoZWQ6IG1vdmUgY2xv
Y2sgcmVsYXRlZCBwYXJhdmlydCBjb2RlIHRvIGtlcm5lbC9zY2hlZA0KPj4gICAgYXJtL3Bh
cmF2aXJ0OiB1c2UgY29tbW9uIGNvZGUgZm9yIHBhcmF2aXJ0X3N0ZWFsX2Nsb2NrKCkNCj4+
ICAgIGFybTY0L3BhcmF2aXJ0OiB1c2UgY29tbW9uIGNvZGUgZm9yIHBhcmF2aXJ0X3N0ZWFs
X2Nsb2NrKCkNCj4+ICAgIGxvb25nYXJjaC9wYXJhdmlydDogdXNlIGNvbW1vbiBjb2RlIGZv
ciBwYXJhdmlydF9zdGVhbF9jbG9jaygpDQo+PiAgICByaXNjdi9wYXJhdmlydDogdXNlIGNv
bW1vbiBjb2RlIGZvciBwYXJhdmlydF9zdGVhbF9jbG9jaygpDQo+PiAgICB4ODYvcGFyYXZp
cnQ6IHVzZSBjb21tb24gY29kZSBmb3IgcGFyYXZpcnRfc3RlYWxfY2xvY2soKQ0KPj4gICAg
eDg2L3BhcmF2aXJ0OiBtb3ZlIHBhcmF2aXJ0X3NjaGVkX2Nsb2NrKCkgcmVsYXRlZCBjb2Rl
IGludG8gdHNjLmMNCj4+ICAgIHg4Ni9wYXJhdmlydDogYWxsb3cgcHYtY2FsbHMgb3V0c2lk
ZSBwYXJhdmlydC5oDQo+PiAgICB4ODYvcHZsb2NrczogbW92ZSBwYXJhdmlydCBzcGlubG9j
ayBmdW5jdGlvbnMgaW50byBxc3BpbmxvY2suaA0KPiANCj4gV2l0aCB0aGUgbm90ZSB0aGF0
IHRpcCB0eXBpY2FsbHkgbGlrZXMgYSBjYXBpdGFsIGFmdGVyIHRoZSBwcmVmaXgsIGxpa2U6
DQo+IA0KPiAgICB4ODYvcGFyYXZpcnQ6IFJlbW92ZSB1bm5lZWRlZCBpbmNsdWRlcyBvZiBw
YXJhdmlydC5oDQoNCk5vdGVkLCB0aGFua3MuDQoNCj4gDQo+IEZvciAxLTEyOg0KPiANCj4g
ICAgQWNrZWQtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQu
b3JnPg0KPiANCj4gDQo+IE5vdywgYXMgdG8gdGhlIGxhc3QgdHdvLCBJJ20gbm90IHN1cmUu
IExlYWtpbmcgdGhvc2UgbWFjcm9zIG91dCBvZiBQVg0KPiBpc24ndCBwYXJ0aWN1bGFybHkg
bmljZSwgdGhlbiBhZ2Fpbiwgbm90IHRoZSBlbmQgb2YgdGhlIHdvcmxkIGVpdGhlci4NCj4g
SnVzdCBub3Qgc3VyZS4NCg0KWWVzLCB0aGF0J3Mgd2h5IEkgZGlkbid0IGNvbnRpbnVlIHdp
dGggYWxsIG9mIHRoZSBvdGhlciBwb3RlbnRpYWwgbW92ZW1lbnQgb2YNCnBhcmF2aXJ0IGZ1
bmN0aW9ucy4gSSB3YW50IHNvbWUgZmVlZGJhY2sgZmlyc3QuIDotKQ0KDQpJdHMgYSB0cmFk
ZW9mZiBiZXR3ZWVuIGhhdmluZyBmdW5jdGlvbnMgd2l0aCAvIHdpdGhvdXQgcGFyYXZpcnQg
aW4gb25lIGZpbGUNCmFnYWluc3QgaGlkaW5nIHRoZSBwYXJhdmlydCBzdHVmZiBmcm9tICJu
b3JtYWwiIHJlYWRlcnMgKG5vdCB3cml0ZXJzLCBhcyB0aG9zZQ0KcHJvYmFibHkgbmVlZCB0
byB0b3VjaCB0aGUgcGFyYXZpcnQgdmFyaWFudCwgdG9vKS4NCg0KQlRXLCBJIHRoaW5rIHRo
ZSBtYWNybyBsZWFraW5nIGlzbid0IHRoZSBtYWluIHByb2JsZW0uIFRoZXJlIGFyZSBvdGhl
ciBtYWNyb3MNCmxlYWtpbmcgYWxyZWFkeS4NCg0KDQpKdWVyZ2VuDQo=
--------------uLSRgxz23yDirGsh3b5wzau0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------uLSRgxz23yDirGsh3b5wzau0--

--------------SW0CtEgoDQ04mHi3OOJ80Cxj--

--------------qqcArw2UNkNKESBZAhTAYfh4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjCgYQFAwAAAAAACgkQsN6d1ii/Ey8r
OAf/Qr2x8nYLyGRENJrie6zcaTwNZyeK2FPaGrjzVaiWjT9VH4G2q5x5mhR5oFWV4toAblU5ow2h
SX840JnBB/J+SkC/W9J4UKM5yKPxGuiAZIyUVnryVO46qdBhemIpMn03Sq3Bij/oQn62902kMQk8
+Fav26WncSGYllLET53pleP3CiC3wO/NrpLc1gGkGJR7e6Mh9/tA4FldPiYKafGEWVvvZvRHGsrb
BK/o5327iIlO40Rj51EE+RKO8uspX4JanSFzCXXis6bGSLcJtqwYK9y4eLMEqqvTNB8h30YWROBp
6YVlChchkh9g1mcOIfBDkyiK0cKJQ9lHSBC7mBkEiw==
=k6d0
-----END PGP SIGNATURE-----

--------------qqcArw2UNkNKESBZAhTAYfh4--

