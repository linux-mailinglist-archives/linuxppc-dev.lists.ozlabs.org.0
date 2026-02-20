Return-Path: <linuxppc-dev+bounces-16991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBU8HRBJmGk6FQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 12:44:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF568167588
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 12:44:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHT125N6pz30Lv;
	Fri, 20 Feb 2026 22:44:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::441"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771587846;
	cv=none; b=U9B34imQCQUvYCdVyAVNbZS/0X5r4/mV5p4BTc24FyLmA8gSNyDh5W4PgVYpDQ1uF15XcFqSoOv/ulcxsotdSOoH6gsFjFXThbMtKEKPoMPdaCM1XsxFS8hQNWLZBV7UTsJMUpx8f3nLpzu0nZJ6m7UuxjmaNsoXG2bBud+o1a3FQ3rcI7JTWWWHtMU8bS4IPaQHHuHfBUnJtTiIRf4fqjIPQJsH5dOKJmmubvTDTnXtC702sJyLUI0PV81X+8/lzQfWeg+3avQHqyEyK4MD6XDADQURrvqESNlykNWqN1q8mLyfthnbL+0XB0BHuY/wRxxpLq/zjr6fdWzLLpDmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771587846; c=relaxed/relaxed;
	bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bw8SmN3pp0a9rnN8S2NWRit3T2EQaKQxSXTfP0TsdVoJikjNx2hZ9lOQn74doHwgubhE9Y3BeJJQBJzygFiVxguwv4Cj8ci7yZeWpGMx1gCvQQ5hfFubzVwuizkHG5W/SS/3q+/WFPOKrHclUlWgaKbXyxLZOwij36LtaPj/QciGdrw3noQRbAs659vWzlVGNqdn5BavNjWDq0ocZpnDGAcdkOX85PcuuVKlL3A8VU8oei+THeNRPZk0K9KGr3ZSgCKUnLJxRvVmyhTV0aXDv5wLVpHM7Cad1/np1FqhhOnA0HgYUANlWgFFk9elMmdGNJN42pfl0+Jm+r1dHaWtEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fwmtmAGg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fwmtmAGg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHT103zg0z2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 22:44:03 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-435f177a8f7so1888974f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 03:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771587835; x=1772192635; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
        b=fwmtmAGgK6haVmP6KjLOzd27mae5sg9LQxIa7lIWts7GqJ+QqGt3Qv15ko5a77rhhB
         zSZOHLMdI0515hmqPxHPmBRArwIPoN8W6kMCY1CL25rj3TcclUDfhF5Mo1S8TWgBuF53
         zIjzyG241RtuI7Jl1SJ38j/kB2V6ll8ovBTRkWVtWQ5Y7XaMGfJnphVc8S9wZosQW0wo
         hlxM/7xhjgKafhkOXGXK0NrGKbYiIw6c9Zl5Qn4Df5j0OPtTwSepuAoxHb7/RKJok3RX
         7Pht8Baeuw+4nSVisCjMxCSfRnzfi7udwyMGduSpHreSLRp6fWt1g3hmX54KoBE7i0rT
         XNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771587835; x=1772192635;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBX6cnPwCpCSH4iNWjZA4c3kEfk5E/AuDIwwlVfhzyo=;
        b=Y1pJuqxRV5Pj+Qguba654tmC37SzIZ8frZz3jtr+nJcUyeGDiJQSXVUxWjebOuked6
         Kr3Ad6+dX8Ep8hHXbvQyCcTTIqbaXpEVy5LuTnxDeKy3AzLsalg3Eu/On4t8bxkRF3jU
         qHF115dRDd7MCbd/HGYsJXS8wJK97jiWmV0lyEgU5NwNK6wGR5c8YT7YBnc/oL2042am
         gZkXPnIGYcrioccEIyPZ4b9XXm+1w/qQL3Y9JX7JPpIKyS/+vd4x8D/DubBFE0i6dNtl
         keDV2FoPc9uyMhVdFLoTsXjyWltmDRRBxTFJhSnnxh02E6aQLsu1dZ/WDCS/phvzHSrv
         QVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXWa7iUyY2Z+6IaO2dharC8cgXZ99vnZLYjdELMC6RGyBSrjrTRCX0WshB+m0kMQduv+Um7gj7FdRDCgA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzmpJyXcQcpA/eCtqy0JFU+5C48OK4YCJE8DPcAmBq4F/X47b7D
	8fhxS07T3q7CMZxvBP0ykAVFeW4wtxowS03cIIrSp/TyP1AYVViC/N/YbSIl/s+ltiU=
X-Gm-Gg: AZuq6aICHuURYjvd3D4ztLeWu+QzEsJbhCtAcsdq7TufIkHmPXrX982Qla5odqat6PQ
	0jnoaqOU9tS1ICx2JQKXtafBHBPU6+ygEmrNMCqoF3IhMSmuuAPZeYm7PszHxzAUbE6jyaJG/dJ
	PVJk36/77hBP6mjgBs+3SsxCk8A/bSKKVf+DIKUW/9yPSYqGJBzI1j0jLwI8QpCTjaXVrS6lMhd
	BY1BecvNg00U6OdTrnqY4c/0HUTy9XZQg8AoS23vTfO0L/bPSwdK/zAt3IVvDTMcHw9QT1D7rWK
	rc53tIs4UcVjMi+u7VbT4yFBaC1VpKk9e4bGckcxmuXX/7az+A1QpEdi61jjaKOM2jEFHPcPqs7
	ALY1UlAXnAPNJ0uvDcao9EeRnki3iHBtDpjlZ9vlLdIWbbWai5F4I2H7bD7rDAWBU7Sg6x+Mlfm
	e6Utvknvvma9G6FCjXoqIyM3Om1WxJ8UWDLFqg/JX/M1h1gM47Jg7/BBQkhP6ojw==
X-Received: by 2002:a5d:5f93:0:b0:435:e060:8071 with SMTP id ffacd0b85a97d-4379db61767mr35206496f8f.16.1771587835206;
        Fri, 20 Feb 2026 03:43:55 -0800 (PST)
Received: from ?IPv6:2804:5078:822:3100:58f2:fc97:371f:2? ([2804:5078:822:3100:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm60289350f8f.5.2026.02.20.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 03:43:54 -0800 (PST)
Message-ID: <f074138f16e49e9966512cce2c07724ae9a77975.camel@suse.com>
Subject: Re: [PATCH 00/19] printk cleanup - part 3
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov	
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Fri, 20 Feb 2026 08:43:42 -0300
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.3 (by Flathub.org) 
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nod.at,cambridgegreys.com,sipsolutions.net,linuxfoundation.org,windriver.com,kernel.org,chromium.org,suse.com,goodmis.org,linutronix.de,debian.org,lunn.ch,davemloft.net,google.com,redhat.com,linux-m68k.org,intel.com,igalia.com,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,gaisler.com,linux.intel.com,foss.st.com,nuvoton.com,nxp.com];
	FORGED_SENDER(0.00)[mpdesouza@suse.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[45];
	FORGED_RECIPIENTS(0.00)[m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:gregkh@linuxfoundation.org,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:jirislaby@kernel.org,m:leitao@debian.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:geert@linux-m68k.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:andreas@gaisler.com,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:laurentiu.tudor@nxp.com,m:linux-um@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kgdb-bugreport@lists.sourceforge.net,m:linux-serial@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-m68k@lists.linu
 x-m68k.org,m:linux-hardening@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16991-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpdesouza@suse.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: BF568167588
X-Rspamd-Action: no action

T24gU2F0LCAyMDI1LTEyLTI3IGF0IDA5OjE2IC0wMzAwLCBNYXJjb3MgUGF1bG8gZGUgU291emEg
d3JvdGU6Cj4gVGhlIHBhcnRzIDEgYW5kIDIgY2FuIGJlIGZvdW5kIGhlcmUgWzFdIGFuZCBoZXJl
WzJdLgo+IAo+IFRoZSBjaGFuZ2VzIHByb3Bvc2VkIGluIHRoaXMgcGFydCAzIGFyZSBtb3N0bHkg
dG8gY2xhcmlmeSB0aGUgdXNhZ2UKPiBvZgo+IHRoZSBpbnRlcmZhY2VzIGZvciBOQkNPTiwgYW5k
IHVzZSB0aGUgcHJpbnRrIGhlbHBlcnMgbW9yZSBicm9hZGx5Lgo+IEJlc2lkZXMgaXQsIGl0IGFs
c28gaW50cm9kdWNlcyBhIG5ldyB3YXkgdG8gcmVnaXN0ZXIgY29uc29sZXMKPiBhbmQgZHJvcCB0
aGVzIHRoZSBDT05fRU5BQkxFRCBmbGFnLiBJdCBzZWVtcyB0b28gbXVjaCwgYnV0IGluIHJlYWxp
dHkKPiB0aGUgY2hhbmdlcyBhcmUgbm90IGNvbXBsZXgsIGFuZCBhcyB0aGUgdGl0bGUgc2F5cywg
aXQncyBiYXNpY2FsbHkgYQo+IGNsZWFudXAgd2l0aG91dCBjaGFuZ2luZyB0aGUgZnVuY3Rpb25h
bCBjaGFuZ2VzLgo+IAo+IFRoaXMgcGF0Y2hzZXQgaW5jbHVkZXMgYSBwYXRjaCBmcm9tIHBhcnQg
MiB0aGF0IG5lZWRlZCBtb3JlIHdvcmsgWzNdLAo+IGFzCj4gc3VnZ2VzdGVkIGJ5IFBldHIgTWxh
ZGVrLgo+IAo+IFRoZXNlIGNoYW5nZXMgd2VyZSB0ZXN0ZWQgYnkgcmV2ZXJ0aW5nIGY3OWIxNjNj
NDIzMQo+ICgiUmV2ZXJ0ICJzZXJpYWw6IDgyNTA6IFN3aXRjaCB0byBuYmNvbiBjb25zb2xlIiIp
LCBhbmQgdXNlZCBxZW11IHRvCj4gdGVzdAo+IHN1c3BlbmQvcmVzdW1lIGN5Y2xlcywgYW5kIGV2
ZXJ5dGhpbmcgd29ya2VkIGFzIGV4cGVjdGVkLgo+IAo+IFBTOiBiNCAtLWF1dG8tdG8tY2MgYWRk
ZWQgYSBidW5jaCBvZiBwZW9wbGUgYXMgQ0MsIHNvIEknbSBub3Qgc3VyZSBpZgo+IEkgc2hvdWxk
IHJlbW92ZSBzb21lIG9yIG5vdCwgc28gSSdtIGxlYXZpbmcgdGhlIGxpc3QgYXMgaXQgaXMuIElm
IHRoZQo+IHBhdGNoc2V0IG5lZWRzIGEgdjIsIGFuZCB5b3UgZmVlbCB0aGF0IHlvdSBkb24ndCBu
ZWVkIHRvIGNvcGllZCwganVzdAo+IGxldCBtZSBrbm93Lgo+IAo+IFRoYW5rcyBmb3IgY2hlY2tp
bmcgdGhlIHBhdGNoZXMsIGFuZCBoYXBweSBob2xpZGF5cyEKPiAKPiBbMV06Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDIyNi1wcmludGstcmVuYW1pbmctdjEtMC0wYjg3ODU3
N2YyZTZAc3VzZS5jb20vI3QKPiBbMl06Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
c2VyaWFsLzIwMjUxMTIxLXByaW50ay1jbGVhbnVwLXBhcnQyLXYyLTAtNTdiOGI3ODY0N2Y0QHN1
c2UuY29tLwo+IFszXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zZXJpYWwvYVNn
ZXFNM0RXdlI4LWNNWUBwYXRod2F5LnN1c2UuY3ovCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyY29z
IFBhdWxvIGRlIFNvdXphIDxtcGRlc291emFAc3VzZS5jb20+Cj4gLS0tCj4gTWFyY29zIFBhdWxv
IGRlIFNvdXphICgxOSk6Cj4gwqDCoMKgwqDCoCBwcmludGsvbmJjb246IFVzZSBhbiBlbnVtIHRv
IHNwZWNpZnkgdGhlIHJlcXVpcmVkIGNhbGxiYWNrIGluCj4gY29uc29sZV9pc191c2FibGUoKQo+
IMKgwqDCoMKgwqAgcHJpbnRrOiBJbnRyb2R1Y2UgY29uc29sZV9pc19uYmNvbgo+IMKgwqDCoMKg
wqAgcHJpbnRrOiBEcm9wIGZsYWdzIGFyZ3VtZW50IGZyb20gY29uc29sZV9pc191c2FibGUKPiDC
oMKgwqDCoMKgIHByaW50azogUmVpbnRyb2R1Y2UgY29uc29sZXNfc3VzcGVuZGVkIGdsb2JhbCBz
dGF0ZQo+IMKgwqDCoMKgwqAgcHJpbnRrOiBBZGQgbW9yZSBjb250ZXh0IHRvIHN1c3BlbmQvcmVz
dW1lIGZ1bmN0aW9ucwo+IMKgwqDCoMKgwqAgcHJpbnRrOiBJbnRyb2R1Y2UgcmVnaXN0ZXJfY29u
c29sZV9mb3JjZQo+IMKgwqDCoMKgwqAgZHJpdmVyczogbmV0Y29uc29sZTogTWlncmF0ZSB0byBy
ZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAgZGVidWc6IGRlYnVnX2Nv
cmU6IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZSBoZWxwZXIKPiDCoMKgwqDCoMKg
IG02OGs6IGVtdTogbmZjb24uYzogTWlncmF0ZSB0byByZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhl
bHBlcgo+IMKgwqDCoMKgwqAgZnM6IHBzdG9yZTogcGxhdGZvcm06IE1pZ3JhdGUgdG8gcmVnaXN0
ZXJfY29uc29sZV9mb3JjZSBoZWxwZXIKPiDCoMKgwqDCoMKgIHBvd2VycGM6IGtlcm5lbDogdWRi
ZzogTWlncmF0ZSB0byByZWdpc3Rlcl9jb25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAg
c3BhcmM6IGtlcm5lbDogYnRleHQ6IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZSBo
ZWxwZXIKPiDCoMKgwqDCoMKgIHVtOiBkcml2ZXJzOiBtY29uc29sZV9rZXJuLmM6IE1pZ3JhdGUg
dG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJpdmVyczog
aHd0cmFjaW5nOiBzdG06IGNvbnNvbGUuYzogTWlncmF0ZSB0bwo+IHJlZ2lzdGVyX2NvbnNvbGVf
Zm9yY2UgaGVscGVyCj4gwqDCoMKgwqDCoCBkcml2ZXJzOiB0dHk6IHNlcmlhbDogbXV4LmM6IE1p
Z3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJp
dmVyczogdHR5OiBzZXJpYWw6IG1hMzVkMV9zZXJpYWw6IE1pZ3JhdGUgdG8KPiByZWdpc3Rlcl9j
b25zb2xlX2ZvcmNlIGhlbHBlcgo+IMKgwqDCoMKgwqAgZHJpdmVyczogdHR5OiBlaHZfYnl0ZWNo
YW46IE1pZ3JhdGUgdG8gcmVnaXN0ZXJfY29uc29sZV9mb3JjZQo+IGhlbHBlcgo+IMKgwqDCoMKg
wqAgZHJpdmVyczogYnJhaWxsZTogY29uc29sZTogRHJvcCBDT05fRU5BQkxFRCBjb25zb2xlIGZs
YWcKPiDCoMKgwqDCoMKgIHByaW50azogUmVtb3ZlIENPTl9FTkFCTEVEIGZsYWcKPiAKPiDCoGFy
Y2gvbTY4ay9lbXUvbmZjb24uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+IMKgYXJjaC9wb3dlcnBjL2tlcm5lbC91ZGJnLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+IMKg
YXJjaC9zcGFyYy9rZXJuZWwvYnRleHQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGFyY2gvdW0vZHJpdmVycy9tY29uc29sZV9rZXJu
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstCj4gwqBhcmNoL3Vt
L2tlcm5lbC9rbXNnX2R1bXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAyICstCj4gwqBkcml2ZXJzL2FjY2Vzc2liaWxpdHkvYnJhaWxsZS9icmFpbGxl
X2NvbnNvbGUuYyB8wqDCoCAxIC0KPiDCoGRyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb25zb2xlLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqBkcml2ZXJzL25l
dC9uZXRjb25zb2xlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxMyArLS0KPiDCoGRyaXZlcnMvdHR5L2Vodl9ieXRlY2hhbi5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZlcnMvdHR5
L3NlcmlhbC9tYTM1ZDFfc2VyaWFsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0
ICstCj4gwqBkcml2ZXJzL3R0eS9zZXJpYWwvbXV4LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGRyaXZlcnMvdHR5L3R0eV9pby5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDYgKy0KPiDCoGZzL3Byb2MvY29uc29sZXMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSAtCj4gwqBmcy9wc3RvcmUv
cGxhdGZvcm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCA2ICstCj4gwqBpbmNsdWRlL2xpbnV4L2NvbnNvbGUuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0Mwo+ICsrKysrKysrKysr
KysrKysrKystLS0tLQo+IMKga2VybmVsL2RlYnVnL2RlYnVnX2NvcmUuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0KPiDCoGtlcm5lbC9kZWJ1
Zy9rZGIva2RiX2lvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA2ICstCj4gwqBrZXJuZWwvcHJpbnRrL25iY29uLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNyArLS0KPiDCoGtlcm5lbC9w
cmludGsvcHJpbnRrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDE0MCArKysrKysrKysrKystLQo+IC0tLS0tLS0tLQo+IMKgMTkgZmlsZXMgY2hh
bmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDE0MyBkZWxldGlvbnMoLSkKClRoaXMgcGF0Y2hzZXQs
IHdpdGhvdXQgdGhlIHJlY2VudCBjbGVhbnVwIGZyb20gUGV0ciBNbGFkZWsgWzFdLCBoYXMgYQpy
ZWdyZXNzaW9uLiBJJ2xsIHdhaXQgZm9yIGl0IHRvIGJlIG1lcmdlZCBmaXJzdCBiZWZvcmUgc2Vu
ZGluZyBhIG5ldwp2ZXJzaW9uIG9mIHRoaXMgcGF0Y2hzZXQuIFRoYW5rcyBmb3IgYWxsIHRoZSBy
ZXZpZXdzIQoKWzFdOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYwMjA2MTY1MDAy
LjQ5NjcyNC0xLXBtbGFkZWtAc3VzZS5jb20vCgo+IC0tLQo+IGJhc2UtY29tbWl0OiA5M2Q2NTU4
NzQ3OWNmYzk3YzBkN2U0MWI1ZThjNjM3OGNhNjgxNjMyCj4gY2hhbmdlLWlkOiAyMDI1MTIwMi1w
cmludGstY2xlYW51cC1wYXJ0My1lYTExNmIxMWIzYTYKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS3C
oCAKPiBNYXJjb3MgUGF1bG8gZGUgU291emEgPG1wZGVzb3V6YUBzdXNlLmNvbT4K


