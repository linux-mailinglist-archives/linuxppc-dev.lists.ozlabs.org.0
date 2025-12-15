Return-Path: <linuxppc-dev+bounces-14781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D7CBF42B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 18:40:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVS502Cl9z2yFK;
	Tue, 16 Dec 2025 04:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765820420;
	cv=none; b=X2FLl1rRkjgs9NtUmtp1iTtrYhgqMVxcUQ3tPr+t1dk65jS4GZRx4fw01mGVHOBSUJ0uslEQy6evu7fVFWT9eNtxO5KmP4xz7WkCNRZH33CDn/wWK0tzj/O9N2Rz2G427/ULx+K9ejaMk4A8RGbJPSskpxmtp2WYAazl45Vh8gh6J0OUjK2ueDjg2C3FMPx9qNJ+E4DjNoOlk/DEdRWe37bDN9xZP4SOUvMghlNw6h2enV0j6Od94Tgbt/vFfpg6EIBF8pqevsf7duCsgurtzBVoolVGz1EZzTzuVl9hMDr3r8UjX/0Xjj4zPpUp9A3CsYLQX/xPnjbyLCWQd+Hq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765820420; c=relaxed/relaxed;
	bh=YwO+8R3t08cYN0VAj8/l4kKgUUQ8j2xcSUHY0WIH+XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jW5qsaH1Y9WRuKq1mPeWgYI9SVrxv0DcYuOE90lHBMa7OCJDph6TKbFhAKDXm9nEJCEEwuFcLk06mSyP5ViPjnJ4O4pjvlymxzSFcJ3sveJzs/NXXCnBoaCCAGJXnaCowcDhN0YK0KvYZxRfsCvtQq30LrNHiG96gUkHcbmDAXXcz+bmO/MQ5+DMmbwpFRoywMoEdRrrsRNUHCNv/1LlT03nGwuoWXybFDfidoH5MlVjkuDE7NcqM9doYFarxZGHcK57QiqkgOFasPH0yfhHWjP5pxiw06plZYLURMBSn2U9bRhX4sVB2k5NEV44NGq7ZPf8N3OWSKTMwprZI++x1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fM+UUN0M; dkim-atps=neutral; spf=pass (client-ip=209.85.128.172; helo=mail-yw1-f172.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fM+UUN0M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.172; helo=mail-yw1-f172.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVS4z2Wm0z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 04:40:18 +1100 (AEDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-787da30c50fso36527287b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 09:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765820356; x=1766425156; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwO+8R3t08cYN0VAj8/l4kKgUUQ8j2xcSUHY0WIH+XI=;
        b=fM+UUN0Mu1FzM2PXSYdNjwBqIgu7Y0i2dNCgqTSJYVxZmy8JLZC97W38oJuVI7lrJl
         tCQ3X/kbHlSnoP4wgs+TSp8isqZEuFg/vb4Q1KkDH2HJI/PSok9CLuL/bO55m/VzBlHV
         md9OTbMf+EoNTDdPhnGFxi28WItvmgPu2fKLS1LvPrum6osf/0cWvINyDAG5GLEDE2gi
         gU2u/pre4je/fx8Sal1ACwzrOHocaX9UPZgLZXoPkuzszKJTpwhtEFWvJ/BdXg5dRcfK
         NLrZSAsZPOAxVhMhbG9YlDrHsCnlGlTsBxK1Np6KB36AjMrxORaA8iT6Ar//+Yp9S/ry
         Nb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765820356; x=1766425156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwO+8R3t08cYN0VAj8/l4kKgUUQ8j2xcSUHY0WIH+XI=;
        b=rHE7Mo8ICUEprGQLUF5k9kXbU+dW1eHBoaQvn1ShfYbeGdBM1qCWFEzRTzp7nt1Y9n
         j9jk6ZzTnSGGWfq1/O5WxSFdmXoVDHkLCs3eosmzpbHFfc/p6/sw3e+3r8zeoXk6sh62
         9nTDzPYNrCAqVsdrfg24DywZFgmaj01yYaRkuaC85GuFHbaOatJGj2PtRNchBoFMIFko
         RPQ4h6QVwHQU35j+Z/SZGBFmfJog43W0FRS316RDFhH2Ea7p0zHW6hwNXOFa2feeTLo2
         G6MCNyx/TFizG67jNPZ1YnEJjPgJtmqqP7YuX3TIdS1nlSg+kknNhzYY4ml8SRRqQ7qj
         BEZw==
X-Forwarded-Encrypted: i=1; AJvYcCUPKCNkuIb5ryWmHS3cNSsSUMT3eW4/eWvDko/KDsP8ubeJrFwCutKtR8gdVrgwLwm2PbjeHzqDOzcDGds=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzh3X+61JsrDoYV4eA40X90X5iCG5jHl8l0of8Pp/g40s5hT7ix
	rr+xRQWQBJyIR3e8elGaiN9AvTRmVSNGkyNkGrAsMAXc0rV6vZLW9Zht
X-Gm-Gg: AY/fxX7kXHCCi9EZ+9YVLD+aJQ1FPnx6oQbx3hTazp3y6mq5JHnlNaIzCskTKcxfn56
	x5AO+xaO9GI/dOd+mIEtvqIg5UrQoZPLKT6YCZyPzCFva0Y9CMmBJvtU4FS8JB90BhYGkw0tt00
	yvexBCV9OxurwxPTviBZjX09nsKnF1O0/HNLJgK8F9XUALb96TMh0LvcjTLTk5LmmnGBwDikNrC
	94ZTGg3x0hF4IiF4wc+WsLwPkakSW6J0qHJFN1TxlWud1ao9V75Tmvdcr81ScK5kQaB22k5uxhO
	p8D5n6QfMG2PKmLT2/0JjpHpkyZ/NZrXpHv75KNbiy9Q+JlLPYtKeQCXJ972pYHE2GDs/rxMJHH
	QitjmAIKsYPAKM3F+0kY4pb56YxZvYmDv+Y+2dlXDeQ5UIasyYglgz7qOMW6y08ur2Ns3eBdcif
	swlvnAow==
X-Google-Smtp-Source: AGHT+IFw4kFr+qFTpX4ESaGTfCJoDkf+gfiQIDxCC2ZRMB7wGug95gwKVuhwJJInotzA/whJCBuumw==
X-Received: by 2002:a05:690c:4d45:b0:788:161c:7117 with SMTP id 00721157ae682-78e66caa12amr228474327b3.8.1765820355853;
        Mon, 15 Dec 2025 09:39:15 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e74a43c4fsm29871577b3.50.2025.12.15.09.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:39:15 -0800 (PST)
Date: Mon, 15 Dec 2025 12:39:15 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	srikar@linux.ibm.com, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
Message-ID: <aUBHw7MvOQYusuuA@yury>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <4ddbb5a1244cf444f330cc73b7d573f47b02f7eb.camel@linux.ibm.com>
 <8368868e-48aa-4a90-95d1-1be4de9879e8@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8368868e-48aa-4a90-95d1-1be4de9879e8@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Dec 05, 2025 at 11:00:18AM +0530, Shrikanth Hegde wrote:
> 
> 
> On 12/4/25 6:58 PM, Ilya Leoshkevich wrote:
> > On Wed, 2025-11-19 at 18:14 +0530, Shrikanth Hegde wrote:

...

> > Others have already commented on the naming, and I would agree that
> > "paravirt" is really misleading. I cannot say that the previous "cpu-
> > avoid" one was perfect, but it was much better.
 
It was my suggestion to switch names. cpu-avoid is definitely a
no-go. Because it doesn't explain anything and only confuses.

I suggested 'paravirt' (notice - only suggested) because the patch
series is mainly discussing paravirtualized VMs. But now I'm not even
sure that the idea of the series is:

1. Applicable only to paravirtualized VMs; and 
2. Preemption and rescheduling throttling requires another in-kernel
   concept other than nohs, isolcpus, cgroups and similar.

Shrikanth, can you please clarify the scope of the new feature? Would
it be useful for non-paravirtualized VMs, for example? Any other
task-cpu bonding problems?

On previous rounds you tried to implement the same with cgroups, as
far as I understood. Can you discuss that? What exactly can't be done
with the existing kernel APIs?

Thanks,
Yury

> > [1] https://github.com/iii-i/linux/commits/iii/poc/cpu-avoid/v3/
> 
> Will look into it. one thing to to be careful are CPU numbers.

