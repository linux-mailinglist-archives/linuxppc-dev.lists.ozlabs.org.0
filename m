Return-Path: <linuxppc-dev+bounces-16765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNyEBPbvimmwOwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 09:44:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DA118542
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 09:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9FVS0tsBz30Lw;
	Tue, 10 Feb 2026 19:44:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770713071;
	cv=none; b=ZfqPgLryjn373jOSjRZFnYnQPmurjg3pPwfAzB3Chz2vMyz0dYivCdVkrznjC9XjjVJa1J3u9LciUM5VLjxni3NzUerfsGHznqZrzvXcWluEY+tXkstZjaktzsUVf3RjzOsABZiYa9HfM2CtVpy6YkUX5+uCSZFJqPxLtbC8/k0JAs25Fy9TSjCdyQVc6GWFj5jJJKKmcz57QNI8ajOwnai2Mmy4Fxy12oyEajb5k05gDnOwwi/zHLFYQEm9DCWBKb/muisp9gAouPlkkUCDF2PtakPrpp/YBWGEb8zGGOgs3cX7cBhUEwDR4lNG6hhBNqTBwwHzMbTNJGz27tpJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770713071; c=relaxed/relaxed;
	bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo53Rx4tYeFUfFajA9xitMy7L4U7wKpyHNhIIEM5+IrxwjmEKFv1EvUTAQSoDEL0R32nGPWICuC6lrQZ4Adg/4YNytfRdc+GbfoY56jIYF5DmmCSdsPujJsSz33KCOtE4gd4eJI2CXmDj7FTFI5du10oNx9oNwlwsO8//Tzx1siAxNZzCtsuYA3pFVV/LTRUmxcBi3f4HBVcqCwLtIH/BRJCdDyCHTR4ztuVqTSdjmn37lCGC0ZfoCQzHvf4+VH56hwee5/FGVQNkt14oN0zK97dbM0cMNNu+70xQX1BGpTPwldiUn6gbJAa8NEDOz8y0hWNC8irZ9famJD2J2nKcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f9P1b4YZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f9P1b4YZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9FVR0DCXz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 19:44:30 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c65822dead7so1573546a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 00:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770713068; x=1771317868; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
        b=f9P1b4YZw7RoEkapP6Fz7iaZm5VyaVxmWEXn6PFwNHRckXFXSQKTzNeRj6b0/RseBA
         c95usHVHFbQw4S+PzxZnZ0vDFCs1iUlj5IC1922yqagoNdQr9BR7mcdMWBEKPxs2UG4b
         AkPDwrlaA3MqU1/ioiD7vhEZ7HMbz6chuvMvWGcs3xU0gE2Lc4fo9SwbbgA2/5AtS2Nj
         pVolegAsbJMpxiuxJuxCyuvgU0/WMtQ5hDmEUQdM0jVmLVzLvZDY2n3ycloGg7dOSV2t
         LQY+1Vtn1bY0Vo9ve8rN9LfZOFk/GsxkbKV2VPuMUlbsPK+nsmFLKHm4r9Jdo/1Z0xfw
         6WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713068; x=1771317868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
        b=JKaAY6rCB5g5ZPXy/YWeNZORqoDbWQkg0NjgQux7vwGQRPob+4SuY1ATC83ugeMKDS
         zFp7b0mvqc1WrnlFBQe1PWdFcTzQht4wG2//O5pZ3Ppdx1EvSqicG+b5vtNS0aDRlV9f
         cpNsQW472GXxqmgxO/MgEYo3ki3Q1HvzLnghF8btI5aHhgZR3H9Xy9c1tb8k0D0AU56D
         FV6+YMvGGtb8VbOJEbWHNs8IZZq/0wInE51xvp2XKTL8YlUbZdSJFQt1IWclVxnJBm3r
         gcSJQC0LkmbdHSHuvTH0rVN2cNwdb6U2Ga+ZG3e4ucH3gaohQDBLMZGe5bFpO6vG4fCG
         DjXw==
X-Forwarded-Encrypted: i=1; AJvYcCVb/OFFvJK/8umwFLbCShG0jqe9Zr5tn1kqP7CzXT7dWF3JTvrrEpQgDc55OEWsv+30S9ZsHzrVlxz5JJQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqF327Ad1mLotu8zrkaG44w6TOe2sK0++SMxDp1yka1mXao1SN
	LYY1ODDLwcefe7HrW2TPBJVhodccvtHsEGITSsRAzCVMc9Vit5KbaRiE
X-Gm-Gg: AZuq6aK13666/MrZX053j3w92vNdiwMOKMLOy+X1I/Kd4nACguFdjF+FJiCjqK/UkWQ
	dXbeoH0g7quMt4KPT+Yw3lbmvsKrQRNlvcjPPfcu5aS7y2UgRgB5IRp12EeuPW4Pfp1ZU5hbZrQ
	fWc/8an5DczbyMsAoBqCi1jgWiHR3dXt8kmM0L55daAsP4Tg/W1OiNBGd6fvCzc2EJ2xZIf0cE1
	n85B9Xijx3c+hBYGcQC3WbnYTrhRtKUqfyP3p3GcKbRH0qxsc8+j7UTyY9w2SGWBYeUASYzt7+B
	W4zVIjXG8qSXgZkYu37c5b5XF67g/hV0qih6DCvITODq90IeY7VWiyAgovIpMXCisybxbzf1PcU
	zzSi+kPZjY69khY9hyqA6pBjoKwuXBe4/Kv5wJuXAHP3qUIEqkWJDe7NlcDactlQgs23Sw7e22U
	oBaV1pIBAYx+F21UNOL4KwnZlVkoTrdQon52aVkRdqJtjnEALwgA7yjKm5+8K6NzCu69I=
X-Received: by 2002:a17:903:1aa7:b0:2a7:9ded:9b46 with SMTP id d9443c01a7336-2a951633be2mr147756965ad.17.1770713067767;
        Tue, 10 Feb 2026 00:44:27 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm125873775ad.30.2026.02.10.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:44:27 -0800 (PST)
Date: Tue, 10 Feb 2026 14:14:17 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYrvZB0FeiV5NzpD@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
 <20260210053756.2088302-4-mkchauras@gmail.com>
 <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-16765-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9F0DA118542
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:22:36AM +0100, Miguel Ojeda wrote:
> On Tue, Feb 10, 2026 at 8:18 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > -``powerpc``    Experimental      32-bit Big Endian only.
> > +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
> 
> As I mentioned in the previous version, this is not a valid level
> (same in the previous patch).
> 
Ah sorry, 
Will fix this.

Regards,
Mukesh
> Thanks!
> 
> Cheers,
> Miguel

