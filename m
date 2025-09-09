Return-Path: <linuxppc-dev+bounces-11972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A7B504F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 20:09:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLsK42TnVz2yxN;
	Wed, 10 Sep 2025 04:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757441352;
	cv=none; b=jBDUIx1eyUW/THi+/vqBpVL+ipGrmrFLBAhjcwI4jyPPRu8jQ5AP7uSrd9co1S/Va84WtjDBMY1nbTM5LH5iJ9PYCT8fnysG0KXTLyYQL9nBzK8Kdr0EXXSTowzU0tHMhK4DJGV34xyas35GoWFmL2bmfUPkxWzuI0D1DdVsNKROSEWsFYr6RmY96T8KWI66jkZuDls5vMDe+56fe6EfevPFEgunKBZMgKkM3z0crBr9HFKPChENSQZuFwrVcOnakLIQQoWimJPBiNJJ6CZpV+2Zg45da/KlQH61q6UBq9PdXeTYK9lctVeY5+rFuxsaZuu8Q2G/YHkbWH9/7nVXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757441352; c=relaxed/relaxed;
	bh=cFnHMKKJvw2hNIRz44gCdMjVIEH9NTGpycW1myzuOAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xw2oE2Mt/flDi39Ay/3VFIUX3EHCUduN68p1wdhK81UA1XCojqT0wlcru/pSXXwy9tkRXlzu3w3dSoP0Jl1wGPYY0pIGZFYVEgkm3hX2Suuo+9VejG4IajgvMLSDhxJj8EldU2NGx9kUMAIwN7jqm1ienZEjNIi7lmVzvZTpE0TQFFDgab/QBp96e9xXizKCkNqfYXhYr5pNbedmnBy6rkdroKvK7ZByB+jW8a5bfcLAyXo094kw+ZQaWPe4hNXWw6nfAy2zdwd3Z7fVGog3GhKfFb8mzisDjfdq+9ivm2PzBQqFOow2sNgH8ADmJdvmEcXZwnYItllxVHhZxvNv5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ocixYpl6; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ocixYpl6; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ocixYpl6;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ocixYpl6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 25882 seconds by postgrey-1.37 at boromir; Wed, 10 Sep 2025 04:09:10 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLsK2265tz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 04:09:09 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D28BD33713;
	Tue,  9 Sep 2025 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757415463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cFnHMKKJvw2hNIRz44gCdMjVIEH9NTGpycW1myzuOAs=;
	b=ocixYpl6AVe2j8JrYrDSOCw4ykekhXgRlgZ0kyF3sjF1/lbNYGQmfQ8B32P6YMos9IeVzr
	wLQT7C/N6jUDIR9QUop/hROMVW2CRK79XLgHWNp0NfV/Pb0+sd0Q7ej1hKw5ugckTmrpcL
	wBh7tK2HBUXbjFx9voyOqbQN0Ym78OY=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757415463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cFnHMKKJvw2hNIRz44gCdMjVIEH9NTGpycW1myzuOAs=;
	b=ocixYpl6AVe2j8JrYrDSOCw4ykekhXgRlgZ0kyF3sjF1/lbNYGQmfQ8B32P6YMos9IeVzr
	wLQT7C/N6jUDIR9QUop/hROMVW2CRK79XLgHWNp0NfV/Pb0+sd0Q7ej1hKw5ugckTmrpcL
	wBh7tK2HBUXbjFx9voyOqbQN0Ym78OY=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3FB51388C;
	Tue,  9 Sep 2025 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LT2UJiYIwGhgKwAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 09 Sep 2025 10:57:42 +0000
Message-ID: <f6965a43-c299-4726-896e-6cccd0a23ae5@suse.com>
Date: Tue, 9 Sep 2025 12:57:41 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GRqgesMXsTlpWDpme2z20vFJ"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	RCPT_COUNT_TWELVE(0.00)[34];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,gaisler.com,linux-foundation.org,oracle.com,alien8.de,arm.com,csgroup.eu,linux.intel.com,davemloft.net,zytor.com,redhat.com,google.com,ellerman.id.au,suse.com,kernel.org,gmail.com,infradead.org,linutronix.de,suse.cz,lists.infradead.org,lists.ozlabs.org,lists.xenproject.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -6.20
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GRqgesMXsTlpWDpme2z20vFJ
Content-Type: multipart/mixed; boundary="------------XzcF73Vy0QpbV8oE9lMvMlg0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Hildenbrand <david@redhat.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
Message-ID: <f6965a43-c299-4726-896e-6cccd0a23ae5@suse.com>
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
In-Reply-To: <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>

--------------XzcF73Vy0QpbV8oE9lMvMlg0
Content-Type: multipart/mixed; boundary="------------d9o8Vv6o396RywxeHiihFy53"

--------------d9o8Vv6o396RywxeHiihFy53
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjUgMTE6MDcsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOg0KPiBPbiAwOC4w
OS4yNSAwOTozOSwgS2V2aW4gQnJvZHNreSB3cm90ZToNCj4+IGFyY2hfe2VudGVyLGxlYXZl
fV9sYXp5X21tdV9tb2RlKCkgY3VycmVudGx5IGhhdmUgYSBzdGF0ZWxlc3MgQVBJDQo+PiAo
dGFraW5nIGFuZCByZXR1cm5pbmcgbm8gdmFsdWUpLiBUaGlzIGlzIHByb3ZpbmcgcHJvYmxl
bWF0aWMgaW4NCj4+IHNpdHVhdGlvbnMgd2hlcmUgbGVhdmUoKSBuZWVkcyB0byByZXN0b3Jl
IHNvbWUgY29udGV4dCBiYWNrIHRvIGl0cw0KPj4gb3JpZ2luYWwgc3RhdGUgKGJlZm9yZSBl
bnRlcigpIHdhcyBjYWxsZWQpLiBJbiBwYXJ0aWN1bGFyLCB0aGlzDQo+PiBtYWtlcyBpdCBk
aWZmaWN1bHQgdG8gc3VwcG9ydCB0aGUgbmVzdGluZyBvZiBsYXp5X21tdSBzZWN0aW9ucyAt
DQo+PiBsZWF2ZSgpIGRvZXMgbm90IGtub3cgd2hldGhlciB0aGUgbWF0Y2hpbmcgZW50ZXIo
KSBjYWxsIG9jY3VycmVkDQo+PiB3aGlsZSBsYXp5X21tdSB3YXMgYWxyZWFkeSBlbmFibGVk
LCBhbmQgd2hldGhlciB0byBkaXNhYmxlIGl0IG9yDQo+PiBub3QuDQo+Pg0KPj4gVGhpcyBw
YXRjaCBnaXZlcyBhbGwgYXJjaGl0ZWN0dXJlcyB0aGUgY2hhbmNlIHRvIHN0b3JlIGxvY2Fs
IHN0YXRlDQo+PiB3aGlsZSBpbnNpZGUgYSBsYXp5X21tdSBzZWN0aW9uIGJ5IG1ha2luZyBl
bnRlcigpIHJldHVybiBzb21lIHZhbHVlLA0KPj4gc3RvcmluZyBpdCBpbiBhIGxvY2FsIHZh
cmlhYmxlLCBhbmQgaGF2aW5nIGxlYXZlKCkgdGFrZSB0aGF0IHZhbHVlLg0KPj4gVGhhdCB2
YWx1ZSBpcyB0eXBlZCBsYXp5X21tdV9zdGF0ZV90IC0gZWFjaCBhcmNoaXRlY3R1cmUgZGVm
aW5pbmcNCj4+IF9fSEFWRV9BUkNIX0VOVEVSX0xBWllfTU1VX01PREUgaXMgZnJlZSB0byBk
ZWZpbmUgaXQgYXMgaXQgc2VlcyBmaXQuDQo+PiBGb3Igbm93IHdlIGRlZmluZSBpdCBhcyBp
bnQgZXZlcnl3aGVyZSwgd2hpY2ggaXMgc3VmZmljaWVudCB0bw0KPj4gc3VwcG9ydCBuZXN0
aW5nLg0KPj4NCj4+IFRoZSBkaWZmIGlzIHVuZm9ydHVuYXRlbHkgcmF0aGVyIGxhcmdlIGFz
IGFsbCB0aGUgQVBJIGNoYW5nZXMgbmVlZA0KPj4gdG8gYmUgZG9uZSBhdG9taWNhbGx5LiBN
YWluIHBhcnRzOg0KPj4NCj4+ICogQ2hhbmdpbmcgdGhlIHByb3RvdHlwZXMgb2YgYXJjaF97
ZW50ZXIsbGVhdmV9X2xhenlfbW11X21vZGUoKQ0KPj4gwqDCoCBpbiBnZW5lcmljIGFuZCBh
cmNoIGNvZGUsIGFuZCBpbnRyb2R1Y2luZyBsYXp5X21tdV9zdGF0ZV90Lg0KPj4NCj4+ICog
SW50cm9kdWNpbmcgTEFaWV9NTVVfe0RFRkFVTFQsTkVTVEVEfSBmb3IgZnV0dXJlIHN1cHBv
cnQgb2YNCj4+IMKgwqAgbmVzdGluZy4gZW50ZXIoKSBhbHdheXMgcmV0dXJucyBMQVpZX01N
VV9ERUZBVUxUIGZvciBub3cuDQo+PiDCoMKgIChsaW51eC9tbV90eXBlcy5oIGlzIG5vdCB0
aGUgbW9zdCBuYXR1cmFsIGxvY2F0aW9uIGZvciBkZWZpbmluZw0KPj4gwqDCoCB0aG9zZSBj
b25zdGFudHMsIGJ1dCB0aGVyZSBpcyBubyBvdGhlciBvYnZpb3VzIGhlYWRlciB0aGF0IGlz
DQo+PiDCoMKgIGFjY2Vzc2libGUgd2hlcmUgYXJjaCdzIGltcGxlbWVudCB0aGUgaGVscGVy
cy4pDQo+Pg0KPj4gKiBDaGFuZ2luZyBhbGwgbGF6eV9tbXUgc2VjdGlvbnMgdG8gaW50cm9k
dWNlIGEgbGF6eV9tbXVfc3RhdGUNCj4+IMKgwqAgbG9jYWwgdmFyaWFibGUsIGhhdmluZyBl
bnRlcigpIHNldCBpdCBhbmQgbGVhdmUoKSB0YWtlIGl0LiBNb3N0IG9mDQo+PiDCoMKgIHRo
ZXNlIGNoYW5nZXMgd2VyZSBnZW5lcmF0ZWQgdXNpbmcgdGhlIGZvbGxvd2luZyBDb2NjaW5l
bGxlIHNjcmlwdDoNCj4+DQo+PiBAQA0KPj4gQEANCj4+IHsNCj4+ICsgbGF6eV9tbXVfc3Rh
dGVfdCBsYXp5X21tdV9zdGF0ZTsNCj4+IC4uLg0KPj4gLSBhcmNoX2VudGVyX2xhenlfbW11
X21vZGUoKTsNCj4+ICsgbGF6eV9tbXVfc3RhdGUgPSBhcmNoX2VudGVyX2xhenlfbW11X21v
ZGUoKTsNCj4+IC4uLg0KPj4gLSBhcmNoX2xlYXZlX2xhenlfbW11X21vZGUoKTsNCj4+ICsg
YXJjaF9sZWF2ZV9sYXp5X21tdV9tb2RlKGxhenlfbW11X3N0YXRlKTsNCj4+IC4uLg0KPj4g
fQ0KPj4NCj4+ICogSW4gYSBmZXcgY2FzZXMgKGUuZy4geGVuX2ZsdXNoX2xhenlfbW11KCkp
LCBhIGZ1bmN0aW9uIGtub3dzIHRoYXQNCj4+IMKgwqAgbGF6eV9tbXUgaXMgYWxyZWFkeSBl
bmFibGVkLCBhbmQgaXQgdGVtcG9yYXJpbHkgZGlzYWJsZXMgaXQgYnkNCj4+IMKgwqAgY2Fs
bGluZyBsZWF2ZSgpIGFuZCB0aGVuIGVudGVyKCkgYWdhaW4uIEhlcmUgd2Ugd2FudCB0byBl
bnN1cmUNCj4+IMKgwqAgdGhhdCBhbnkgb3BlcmF0aW9uIGJldHdlZW4gdGhlIGxlYXZlKCkg
YW5kIGVudGVyKCkgY2FsbHMgaXMNCj4+IMKgwqAgY29tcGxldGVkIGltbWVkaWF0ZWx5OyBm
b3IgdGhhdCByZWFzb24gd2UgcGFzcyBMQVpZX01NVV9ERUZBVUxUIHRvDQo+PiDCoMKgIGxl
YXZlKCkgdG8gZnVsbHkgZGlzYWJsZSBsYXp5X21tdS4gZW50ZXIoKSB3aWxsIHRoZW4gcmUt
ZW5hYmxlIGl0DQo+PiDCoMKgIC0gdGhpcyBhY2hpZXZlcyB0aGUgZXhwZWN0ZWQgYmVoYXZp
b3VyLCB3aGV0aGVyIG5lc3Rpbmcgb2NjdXJyZWQNCj4+IMKgwqAgYmVmb3JlIHRoYXQgZnVu
Y3Rpb24gd2FzIGNhbGxlZCBvciBub3QuDQo+Pg0KPj4gTm90ZTogaXQgaXMgZGlmZmljdWx0
IHRvIHByb3ZpZGUgYSBkZWZhdWx0IGRlZmluaXRpb24gb2YNCj4+IGxhenlfbW11X3N0YXRl
X3QgZm9yIGFyY2hpdGVjdHVyZXMgaW1wbGVtZW50aW5nIGxhenlfbW11LCBiZWNhdXNlDQo+
PiB0aGF0IGRlZmluaXRpb24gd291bGQgbmVlZCB0byBiZSBhdmFpbGFibGUgaW4NCj4+IGFy
Y2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmggYW5kIGFkZGluZyBhIG5ldyBn
ZW5lcmljDQo+PiDCoCAjaW5jbHVkZSB0aGVyZSBpcyB2ZXJ5IHRyaWNreSBkdWUgdG8gdGhl
IGV4aXN0aW5nIGhlYWRlciBzb3VwLg0KPiANCj4gWWVhaCwgSSB3YXMgd29uZGVyaW5nIGFi
b3V0IGV4YWN0bHkgdGhhdC4NCj4gDQo+IEluIHBhcnRpY3VsYXIgYmVjYXVzZSBMQVpZX01N
VV9ERUZBVUxUIGV0YyByZXNpZGVzIHNvbWV3ZWhlcmUgY29tcGVsdGVseSBkaWZmZXJlbnQu
DQo+IA0KPiBXaGljaCByYWlzZXMgdGhlIHF1ZXN0aW9uOiBpcyB1c2luZyBhIG5ldyB0eXBl
IHJlYWxseSBvZiBhbnkgYmVuZWZpdCBoZXJlPw0KPiANCj4gQ2FuJ3Qgd2UganVzdCB1c2Ug
YW4gImVudW0gbGF6eV9tbXVfc3RhdGUiIGFuZCBjYWxsIGl0IGEgZGF5Pw0KPiANCg0KVGhl
IGNvbW1lbnQgYWJvdXQgdGhlICJoZWFkZXIgc291cCIgbWFkZSBtZSBsb29rIGludG8gdGhp
cyBwcm9ibGVtOg0KDQpJdCBzZWVtcyBzb21lIG9mIHRoZSAiI2luY2x1ZGUgPGFzbS9wYXJh
dmlydC5oPiIgaW5zdGFuY2VzIGluIHRoZSBjb2RlDQpiYXNlIGNhbiBqdXN0IGJlIGRyb3Bw
ZWQuDQoNCkZvciB0aGUgcmVtYWluaW5nIGNhc2VzIEknZCBsaWtlIHRvIHN1Z2dlc3QgYSBy
ZW9yZyBvZiB0aGUgcmVsYXRlZCBoZWFkZXJzOg0KSW5zdGVhZCBvZiBoYXZpbmcgdGhlIG5v
bi1wYXJhdmlydCBkZWZpbml0aW9uIGluIG9uZSBoZWFkZXIgYW5kIHRoZSBwYXJhdmlydA0K
b25lcyBpbiBwYXJhdmlydC5oLCBtYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBv
bmx5IHRoZSBwYXJhdmlydA0KZ2VuZXJpYyBkZWZpbml0aW9ucyBpbiBwYXJhdmlydC5oIGFu
ZCB0aGUgc3BlY2lmaWMgZnVuY3Rpb25zIGluIHRoZSBoZWFkZXINCmRlZmluaW5nIHRoZSBu
b24tcGFyYXZpcnQgdmFyaWFudC4gVGhpcyB3b3VsZCBwcm9iYWJseSByZXNvbHZlIHRoZSBw
cm9ibGVtDQp3aXRoIHRoZSAic291cCIsIGFzIHBhcmF2aXJ0Lmggd291bGRuJ3QgcmVseSBv
biBzbyBtYW55IG90aGVyIGhlYWRlcnMuDQoNCkknbSBqdXN0IHByZXBhcmluZyBhIHBhdGNo
IGRvaW5nIHRoZSByZW1vdmFsIG9mIHRoZSBub3QgbmVlZGVkIGluY2x1ZGVzLCBidXQNCkkn
ZCBiZSB3aWxsaW5nIHRvIGFkZHJlc3MgdGhlIGRpc2VudGFuZ2xpbmcgYXMgbm90ZWQgYWJv
dmUuDQoNClRob3VnaHRzPw0KDQoNCkp1ZXJnZW4NCg==
--------------d9o8Vv6o396RywxeHiihFy53
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------d9o8Vv6o396RywxeHiihFy53--

--------------XzcF73Vy0QpbV8oE9lMvMlg0--

--------------GRqgesMXsTlpWDpme2z20vFJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjACCYFAwAAAAAACgkQsN6d1ii/Ey+Y
rAf/a4oKv1HBGDLbyN8w9JJ1cvmDi8HCAVfE8JpHcscFZ6WfY0W3x7b2BXcNBGAweVtspi+Khbh7
p2jCnvCaEWA68NFXxp/i+Jgk8dzbtvEga/H/v3E/MysbxG2y5GzDrh03L6TJpzLinkMabDXj2YLh
0dh415a3I+mSGd8oIAETpH0UsCL8f5SSY7jl9NwNPSelfslAY0AjNVQz/DnrmyIr8QfGeyAOuyWN
u1ECkDwVJb/Egirn8Yur5N8Mhsre0q02WSdIQdohQ3RJIcUNCQ3DNTR2vqNXjEf1wEQmU5nMxbnA
dy5/GJfBm79JHqzXY+qTn4mz44Xy8GnnpNtRKt6lZQ==
=I/jH
-----END PGP SIGNATURE-----

--------------GRqgesMXsTlpWDpme2z20vFJ--

