Return-Path: <linuxppc-dev+bounces-17639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GjyJ3BYp2lsgwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:53:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638C1F7C8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:53:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQV1M3jqzz2xSD;
	Wed, 04 Mar 2026 08:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772574823;
	cv=none; b=kEQMP9M8jpsrr+/noqFn9rghudMstN0FEdhhYHFC+37ZtQ1mqp7stx43c22pqvGa2nBVjgt91eGY37eZSaOpvWvMEOq3bhKhxFCUwAAdGH+cjkzOmm5l0k9ti41Ba1Ml1pbPwANEZfZ6RsmRz1FSl9EYofzxtceZf0ROgZD228uByDPKiVz4jOAzm9pWf4/zQKIhAzU/Rg3ht4F2bdoSiKJ9KsGflAgKHdKFdbm+Ob64riLqJGLP8LV+sOsv7jNobOrpvqdNbu3gDiJxMxmtibmMoTCps2KNw2r1xyjaUO51hS4gmzWBqsqoQal3X394Qjr3uweSHaLmcPPd5LwHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772574823; c=relaxed/relaxed;
	bh=D1r1C1nkJC8myDUqBbWlJuno+S+Hsv+z3MI/a3FcqHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBPHaMY7HMP+xx1eN9Avc7Z0dOzjvK6yS3c0Xg/w1gBf0cv8AWjKW/+LhmkTt7XY1WGMvxkFxpNZD/dkfh7sIDe9oXonnQTZtdo3gaDSsL7bM4noLOZKbLTM0EtLcwjtFlCkJF/VlgjmT63zak8otWa5c+h2JLGfDW8YyNG4HLso/gDmei/VgIaTb5ct0PC3+nPC8DC1EjvuEadAPIwQfmECEIoshKNMHu/6raDHuXFhdf3SSC7HHbQ1SWsG7MXnbdlDjz5JU7HdCG5qWaO66IExDutlxVq6/BBS2A2b+h0svD7gGjSvQ6sxEZp63t+SCukuMybhN9uiwGE9Hc3A6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=RLwZ/rk8; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=RLwZ/rk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQV1L2r1Rz2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 08:53:41 +1100 (AEDT)
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623LavOS3436858
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 13:36:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623LavOS3436858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772573825;
	bh=D1r1C1nkJC8myDUqBbWlJuno+S+Hsv+z3MI/a3FcqHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RLwZ/rk8vaq6V4tFXUGKShs9EBYHpeXArYtAO8GRTPF0Qb9ckRJAy3tcD5EWeuBHX
	 vr0OB9eU7N3DVYjRVanoVDfqhq4F+AkTzExopgowDGEFypgJWOgNXBkU6FNdThL97f
	 Lw7JtD6O+ENFjRKkORJY5LGdYpcgeiUuBzkeJbD5nNV5qeKq9oq8xMw9GJMwXTJY58
	 GQjC3/XyTBNrpt/UhJOXTqWbTWEJKRY1JmqsyxsLflRD6J85F4d6toUWrWmiKQly38
	 ciLSIrOtlh968Kr67YxA/mjWIPI5I11u1R6hN8+kq3t5kAbHjJDAA+e6EhT7AmEGux
	 lOCVXVCJis+ZQ==
Message-ID: <0d2d834d-0f3c-43bb-9530-da6c2492763a@zytor.com>
Date: Tue, 3 Mar 2026 13:36:52 -0800
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
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
 <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
 <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <d92f424c-9aee-417e-899e-3a0002a80f4a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3638C1F7C8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17639-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid]
X-Rspamd-Action: no action

On 2026-03-03 13:27, Arnd Bergmann wrote:
> 
> I see. I would argue here that a link failure is actually the best
> case then: the entire point of CONFIG_COMPAT_32BIT_TIME=n is to
> enforce the fail-early case, as opposed to silent data corruption
> after (now) 12 years of operation.
> 
> I don't think there is an actual link failure here, as dl_vdso_vsym()
> resolves it at runtime by glibc (when using time32), while musl
> doesn't use __vdso_gettimeofday at all.
> 

Well, the former is a link failure -- just one handled reasonably gracefully.
A library that really wants a fallback can presumably also avoid the problem
by provide a weak reference for the fallback.

	-hpa


