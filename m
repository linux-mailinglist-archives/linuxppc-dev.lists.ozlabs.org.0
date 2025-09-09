Return-Path: <linuxppc-dev+bounces-11940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511CB4A866
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLf3z5Qc5z3cZx;
	Tue,  9 Sep 2025 19:42:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757410927;
	cv=none; b=gF2RIMawqTxsRVu2I/21E4WvORvlnu9P2jrxU0410AB8aPiL7O/WXkZxTJwVCV+7QY9eTu/NREwCLbJt5iL90HpKWsB0Z5EGDRAZykzCUzKX+4M64W7Hd0dqcygo1g0abVb7ipHXpVzUYoYY/o/bhVPU2aZNgnKjGdKOy3guuvGVaaY4GXQ6kK2m2sexw3JRxe5vYzNrFsnNRxBQyCD/B3hWLz1/dHhxMBAKYWk3RifxU6BZ8NPCi4NDoIsrZmhl2oSn8kVxFpiTGHYPSwG1KoCHBUsYmxilRh+5AvSLXc1BNfmLm+qz4CBmyxsHCWrhJV7n/0cEHe3qvY91LEqYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757410927; c=relaxed/relaxed;
	bh=SjRoDXFIQA5duWfB2MZCu0jToXiY+NtBhO/biBCm3yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cO6uirx4MkDiFz4+QGC7kqE2hAu90mHmxD1x/yv1UuHVcKlt6Di6g8sFxqtKQtLLK6TP2Ovr27dXdjRZh+WHSctJZWPMn7sFsqo2pxl/nwUleje+WoL6vOxy8ZcxQdc+9HJyHyAJ2t3ER8gAC5sHHDhEGJHOx7+/iGYcA98Z29RJKgkIzDAcz+ekSCJBKfYXC1/Nk9hOSfyzFs/PbtULjorkYa9FnbOG5pfJML4GHzTunWK/ZQpHBohtdUZKj25yZeP+FDu/R9xeHjRfshW+w89Qt6zOmKLSR1/gk67MIJcq2oLgXF33ryKCC2pR41vigyHTgLNklruc07KYJrPoVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eFz0SB+4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eFz0SB+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLf3y4ZYsz3cZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:42:06 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so13401555e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757410924; x=1758015724; darn=lists.ozlabs.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SjRoDXFIQA5duWfB2MZCu0jToXiY+NtBhO/biBCm3yY=;
        b=eFz0SB+4dr7QQ+ZmeOezGAwydsYa0Y5UlyUozWVWmvcx20jCQ6AAjW1+hXmCOArVDs
         fkdUj55Q6iAqDA3Gql3U9LzyvsOzBSmplFO6d3NpY8gPQ50ZAEYgZ1g8Ucl2jgieFFiA
         hWVU5rK+yRkABtWZ40vFmcR+5mD2e534QmHMadKYblcubL+x3ikMND1DYWLJZXTbbykm
         v311d5yG0rtBFbnF2rXhWOILsAswV3FSPVB5TrAsu6MFfL0Xv7jvFtw1lt4a774ESu9l
         BCEmLyWHsXbumDM3h/pbmhOeKK/gMQoLOJx0BzZcbj62LeGnwFTynil9VT+LiZ9yddki
         IGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410924; x=1758015724;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjRoDXFIQA5duWfB2MZCu0jToXiY+NtBhO/biBCm3yY=;
        b=tDJ9O3yV/4rNunoZx1wbplPTRvojHJBiHDVs8RHzrmHL7bocTuB/YnmfxxTZJOYHgl
         tGOQx8wJLFssn6G7NqUIA/ozkVZLh6/A4ZbE9jEHZ/CReavCyjkm6VNGRb+TfQROf8/F
         o3VVqrBGXYfACcgoBCBshQSQhK7a3AFz9JetDtAKlTz0WcHdYTCphP9UGcPxG9/oXo8L
         OzvjZ/pgjBb9VtDNBTqw8mLsn/vC22VMWQpH7EUPriMta5dE7z4DtrQ4K4JR6Qqkmqlj
         DRea9gDtK+Oh57gU6393YmtvgaELGzFa+Af6wLbkAUxOodrm+vvWje9I88SOps8XsqBT
         S+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfA2N/OalB1EFu/4PBel1g1vhEZizXSjPHaI2Rbh4FgBHxmpX1C7cIha2bKH+eEuVwDZ5a7tkZLodkYn0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLHIhnD2SbCfa6d+erELSDgChyJhK4p8DKAXSzOASEzHLGoDwt
	AzWIJL4Fp1q7Epaq1iSszpi3/VuzRvlJOnCDbdWZ5cD2IuWk89KLgsuMlX4d4pCUGN0=
X-Gm-Gg: ASbGncsjVNNSF+hRDBPEueXg2QiJRTyYVa5xavab3TS5BJI+TsDOG/w9uUNQ7vjC2yV
	oidvlyyL5CWp/mygPQY/zCpamUY35/YmRenlVh53aFVBRzpiLyO4PFU503g4oRCMJjmtHkQEVKh
	ZnNLKtvBM9OBIWHL4HcfRLUhc4KZiSJzaaKbv6lDaiTErX83qHDP5I/lY0ZW5by9xXUTpFAUInQ
	TtHHJ2iZX9PjtPNDMpT062E0LMuidYqHTU+7ujDLZfYsL1kt9IJQTanqcywhYBabnFYTCS4qLw+
	Q6jTWBBHFBrFdA5sXSDsMieeixZEwVoOQ6hD6pIenquzfQOInnWgQZRRwm235NoLClqe0xveun1
	EytdQwZvisxrZTtSZVQ2MtCvs0s3JA+RYCnrZFzDlPB7h2oqmt5BK0PYqk1KthVCOF7wOihPz02
	Jc5nUK3eBKv0iLMI/RDTkYIhIlC1+J84SsxCO+CuThl/Ht07qIj5IJCiQ=
X-Google-Smtp-Source: AGHT+IENj+1E2T8r/gDXDQF+CsCcmRvQT/1w4yxsS7gi6iQW38MFrgfpZ1CxcgavO4g+sqDlHTXLsg==
X-Received: by 2002:a05:6000:2c0d:b0:3e7:441e:c9e1 with SMTP id ffacd0b85a97d-3e7441ecde8mr6021132f8f.18.1757410923604;
        Tue, 09 Sep 2025 02:42:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b? (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de. [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238832sm1864553f8f.31.2025.09.09.02.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:42:03 -0700 (PDT)
Message-ID: <a23237ea-5b29-402f-850c-743e106e5f7c@suse.com>
Date: Tue, 9 Sep 2025 11:42:01 +0200
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
Subject: Re: [PATCH v2 4/7] x86/xen: support nested lazy_mmu sections (again)
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-5-kevin.brodsky@arm.com>
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
In-Reply-To: <20250908073931.4159362-5-kevin.brodsky@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6t70nAkYkpQ5fhIc00dD9qVa"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6t70nAkYkpQ5fhIc00dD9qVa
Content-Type: multipart/mixed; boundary="------------0NiQUpv1CWC70bbdwQmMvvwT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Message-ID: <a23237ea-5b29-402f-850c-743e106e5f7c@suse.com>
Subject: Re: [PATCH v2 4/7] x86/xen: support nested lazy_mmu sections (again)
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-5-kevin.brodsky@arm.com>
In-Reply-To: <20250908073931.4159362-5-kevin.brodsky@arm.com>

--------------0NiQUpv1CWC70bbdwQmMvvwT
Content-Type: multipart/mixed; boundary="------------4l0ODE8pZhEM8pbolfSSghyw"

--------------4l0ODE8pZhEM8pbolfSSghyw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDkuMjUgMDk6MzksIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IENvbW1pdCA0OTE0
N2JlYjBjY2IgKCJ4ODYveGVuOiBhbGxvdyBuZXN0aW5nIG9mIHNhbWUgbGF6eSBtb2RlIikN
Cj4gb3JpZ2luYWxseSBpbnRyb2R1Y2VkIHN1cHBvcnQgZm9yIG5lc3RlZCBsYXp5IHNlY3Rp
b25zIChMQVpZX01NVSBhbmQNCj4gTEFaWV9DUFUpLiBJdCBsYXRlciBnb3QgcmV2ZXJ0ZWQg
YnkgY29tbWl0IGMzNjU0OWZmOGQ4NCBhcyBpdHMNCj4gaW1wbGVtZW50YXRpb24gdHVybmVk
IG91dCB0byBiZSBpbnRvbGVyYW50IHRvIHByZWVtcHRpb24uDQo+IA0KPiBOb3cgdGhhdCB0
aGUgbGF6eV9tbXUgQVBJIGFsbG93cyBlbnRlcigpIHRvIHBhc3MgdGhyb3VnaCBhIHN0YXRl
IHRvDQo+IHRoZSBtYXRjaGluZyBsZWF2ZSgpIGNhbGwsIHdlIGNhbiBzdXBwb3J0IG5lc3Rp
bmcgYWdhaW4gZm9yIHRoZQ0KPiBMQVpZX01NVSBtb2RlIGluIGEgcHJlZW1wdGlvbi1zYWZl
IG1hbm5lci4gSWYgeGVuX2VudGVyX2xhenlfbW11KCkgaXMNCj4gY2FsbGVkIGluc2lkZSBh
biBhY3RpdmUgbGF6eV9tbXUgc2VjdGlvbiwgeGVuX2xhenlfbW9kZSB3aWxsIGFscmVhZHkN
Cj4gYmUgc2V0IHRvIFhFTl9MQVpZX01NVSBhbmQgd2UgY2FuIHRoZW4gcmV0dXJuIExBWllf
TU1VX05FU1RFRCB0bw0KPiBpbnN0cnVjdCB0aGUgbWF0Y2hpbmcgeGVuX2xlYXZlX2xhenlf
bW11KCkgY2FsbCB0byBsZWF2ZQ0KPiB4ZW5fbGF6eV9tb2RlIHVuY2hhbmdlZC4NCj4gDQo+
IFRoZSBvbmx5IGVmZmVjdCBvZiB0aGlzIHBhdGNoIGlzIHRvIGVuc3VyZSB0aGF0IHhlbl9s
YXp5X21vZGUNCj4gcmVtYWlucyBzZXQgdG8gWEVOX0xBWllfTU1VIHVudGlsIHRoZSBvdXRl
cm1vc3QgbGF6eV9tbXUgc2VjdGlvbg0KPiBlbmRzLiB4ZW5fbGVhdmVfbGF6eV9tbXUoKSBz
dGlsbCBjYWxscyB4ZW5fbWNfZmx1c2goKQ0KPiB1bmNvbmRpdGlvbmFsbHkuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+DQoN
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVl
cmdlbg0K
--------------4l0ODE8pZhEM8pbolfSSghyw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------4l0ODE8pZhEM8pbolfSSghyw--

--------------0NiQUpv1CWC70bbdwQmMvvwT--

--------------6t70nAkYkpQ5fhIc00dD9qVa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi/9mkFAwAAAAAACgkQsN6d1ii/Ey80
SAgAiJl65x111bqE27qLDXwGxB+GHINdgm+I0ml8OZ3XtcdZfY5Bn8HD+AFRa9lSJsdUCcklLH88
S/XTNIYun/KfdgyVrC8qkhA6upKCQ0rpmnpVnLRbhGIAfdA1IzOEVv2DasQOSUIW2FrnDMHnIM5j
9+GsXLikB0D+M5Sev7kMHqH0v6VpecDZxbEu6/sLpb/M/HFFLElALOu7Hyc50kf9HcdEFGeRGWGS
zeCAhFKiMqstJpK5XcvR/Gt9WVh9pNNhIyYYHfDfImt28tyiC90MYW+bnoykmn4S2v3yVQOo5qbZ
Ejwt4zi2ksSSuPgsa0AerARvR/6wjZwPfi35XC3Gfw==
=Ew/s
-----END PGP SIGNATURE-----

--------------6t70nAkYkpQ5fhIc00dD9qVa--

