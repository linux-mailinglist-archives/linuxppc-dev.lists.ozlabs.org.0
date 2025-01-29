Return-Path: <linuxppc-dev+bounces-5672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DAA218D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 09:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjZpv3mf1z2xgv;
	Wed, 29 Jan 2025 19:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738138839;
	cv=none; b=YBCYYkuQ1HnxxBvpgbtOmmWfv5nZIEvgujczb5t34p53egao/7lz/UIGT1y+pnF4xsVWNJYIaWbfTw127m2J0tEMfRnDDrultksXS5cH9lbVSkRHqG4veVa6M/BhITaw1czf83/U1wqU1LonLwPG/8xeQtPbaHt2ByEu0iFeL5elBYqEiQinDQlJmQF1vH2jWT/L/p6daVrefF9MuVGwOQkingjbWSyeghwQQcGIW4JF8Yhm6eo8BOBuiW9qsyDtXxrpvwNHfSisTIWkyKjuXCsxgF60VT1jNQyPv5LUarZ4yHmGbDknJPLpidy40R0UEFun7LM01i3uYoN4PakHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738138839; c=relaxed/relaxed;
	bh=gqmdrhLhgUhlbASUkaeBokyDqu4akvh1PexfVv5wsLs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UeEbpF6jPTi6Zq8OToIBBgDZcut0utXThp1cwy0gxP9TkOOBGWWahdKEGDUFRqudcn459ulovFE99o26OfWcD0ICsexfZLW08B9faBnlmBVetjc1EyFHn0RvDQeycrw0TgaS6VkKmZQWyYuALoN+Y6ZCdhLr9i/TpQC73Mj64C9Ujr/mJFSZ1X1iNXRrDDGC0L2DklSI7U24hiqBRQ0oZUw5+y6VkEvr9ciTFY984PIUZlOQc5uFRPmoRD3mRY8DnST36coPkdTNGjnFRV+YI8fiwJpiyuLjAEJnxPPfWJp3S8PNpXzwDpH8oYFGE2iQSfEX1eN/7asN9apwgXQqsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L+MOnafk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L+MOnafk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjZpt4vPXz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 19:20:38 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso9126452a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 00:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738138836; x=1738743636; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqmdrhLhgUhlbASUkaeBokyDqu4akvh1PexfVv5wsLs=;
        b=L+MOnafkOFhL6Xvvt20kxZcpUYJTPYeHVgk9ZGmltIzpgqiHGvtfj03+tXqKPgQEDz
         z+aSm/r/HwC1qX0rXgc1C6HZAUjyyZWqAf9u4mXQQVMTPA7EALntHhjIqDX2gY/IIEgI
         mdmqmgQLnk4Q4Y21XUr18pid19II23aScrUlUeroudLJm0rp/ksd2l7YsIpzV3SuWD0k
         cnZW6lV2wexAM4Wr6IqqHekbDZ2VgLzlloK0Ieojdbwr12fjchKpCzuxqAGOSvIFQSAN
         KgyV2JSxvh5BKXCtiwDsFRhFVAp65aIT4VOUtugzzs1ffyjTOKi021YcDU7v55zXNZK4
         OvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138836; x=1738743636;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gqmdrhLhgUhlbASUkaeBokyDqu4akvh1PexfVv5wsLs=;
        b=cecsH3XJ3VML5d8R9ZdxQaoBZlnSXAcQn5W2kJUXM4irgTpsAjeSUIPBBHvtkAqtLE
         2ZTqymt1wOOnkLOp/USev9SIh7KsYg8+LNHrSV0iJIH4csqL7/XEuwEFrqKoLG2hOkc6
         K0O7u6shmpvuBlQzKLw0BZG80WY1cONbu3xb94XJ4B3GCLSjs7Jx96jkOjIw2ZQ7DBfr
         2/ywS6ddDDoiUXG8ZnGiUa5GKdmhhS0Ss1HtMtdmSuxm89hK/RWOwHszlUp2bBIekD4W
         7Po1cfdV08UvrkDYIZ57PXAsseLWfSsdi48kjIDh1rrYNA7arKHu6N7MotpwkrQ/91GD
         p5ww==
X-Gm-Message-State: AOJu0YysgSgdBn4lWdBRmIfV7/Q9wjuXVaQfGr9wjrKQJQ3zlPSdaSJG
	I9kuPZGqF//7nrpFLowPGkNykOqkUaxOeLTm08eBpyMlgFuVLgvInejr/g==
X-Gm-Gg: ASbGncuBQtI7PTPMD8vwBjhg6ExAqIR+NIjvD6Mis0FHZ7mgxM49dQRS5acWvTeYLCQ
	Uxmq2eCq6QDGT2sR6XdVz3mouiVlINspx5slDXC2FLdlCTZne68/d3+yaCXAwhu8ZUJzx5cGxT3
	9mdHA1AjMJqJC4yI7GP+FB4nMNsy4V2hisERkbBz+lcRpG1msXeSvcEozPHLr8R5U9mdS+Yq3Sf
	Y4qBwT00re56BltBjjF8O60+x+q0E6cMAoOfga+UqbvKxisJLD0cdIxPeHYzlhoX37VoKhc/xLn
	LRh51WDA
X-Google-Smtp-Source: AGHT+IHLahW0qcPoki0ZpmTaAnPsDNLunJorBhBeRsNG7UjkOBJ5NxvRyJHf7Rg2HLsrXgtToFbXzQ==
X-Received: by 2002:a17:90b:4d06:b0:2ee:ab29:1a57 with SMTP id 98e67ed59e1d1-2f83abb3553mr3463255a91.2.1738138836069;
        Wed, 29 Jan 2025 00:20:36 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd1599sm1075361a91.15.2025.01.29.00.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 00:20:35 -0800 (PST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 18:20:31 +1000
Message-Id: <D7EESJRZLTRN.37Y8R25CUSCY6@gmail.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/5] powerpc/microwatt: Device-tree updates
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
 <D7ECKPNWAU7O.39PRDJ4PIG0P9@gmail.com>
 <Z5nWXtdCokYuVbXo@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5nWXtdCokYuVbXo@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 5:18 PM AEST, Paul Mackerras wrote:
> On Wed, Jan 29, 2025 at 04:36:14PM +1000, Nicholas Piggin wrote:
>> On Wed Jan 29, 2025 at 8:52 AM AEST, Paul Mackerras wrote:
>> > Microwatt now implements ISA v3.1 (SFFS compliancy subset), including
>> > prefixed instructions, scv/rfscv, and the FSCR, HFSCR, TAR, and CTRL
>> > registers.  The privileged mode of operation is now hypervisor mode
>> > and there is no privileged non-hypervisor mode; the MSR[HV] bit is
>> > forced to 1.
>>=20
>> Cool. Lots of development in microwatt.
>>=20
>> Come to think of it we should have put a broadcast-tlbie feature
>> in there and you wouldn't need the other patch. That can go on
>> the todo list I guess.
>
> I thought about doing that, but it would add complexity and I'm not
> sure it would actually have any measurable performance benefit.  When
> I saw it was optional in the ISA for LCS and below, and that the
> kernel has all the machinery for handling the cross-CPU invalidations
> via IPI, it became very much the path of least resistance to use the
> kernel machinery.

I was unclear, I meant we (well, I) should have added that feature
to the cpufeatures device tree. I'm sure I did because I also added
the IPI+TLBIEL support but must be mistaken or never submitted it.

Perfectly reasonable to not add broadcast tlbie in microwatt.

>
>> system-call-vectored was available in ISA v3.0. Not that we do much
>> with it at the moment IIRC, but there were dreams of wiring it in for
>> compat guests. With that fixed,
>
> Interesting.  I looked in my copy of v2.07 (PowerISA_V2.07_PUBLIC.pdf)
> and it mentions rfscv in a couple of places, but has no description of
> scv or rfscv.  I'll change it to v3.0.

Yeah that must be a mistake in the 2.07 doc.

Thanks,
Nick

