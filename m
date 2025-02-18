Return-Path: <linuxppc-dev+bounces-6328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 201E1A3AA2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 21:58:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyBgs4dMzz2ykX;
	Wed, 19 Feb 2025 07:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c01:e000:3a1::42"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739912297;
	cv=none; b=DCSybATKCKWdMcJW9PKV1Y0OtaAT1HKmuKisEYBRqkbatw2/O4sMnX52fqwl2IoLlFXgU0SAgL096Tyo31CBR4jgaSEwQnPFWmoyeS3g2a8vPWgxXAvwzDbfJGQ2xywSHB/ZAt1xGGem4eYgYzH1ICO3VF16m0BYWcNJEU9VKsjkoYW7O7z2VIqnqT8M8X/SAyDZUk46RyJ0CBoHS9P2H7aNofkN0Q5KZgEUXqUwLnmBKTAi/dm08EaUyLqmum/fu4cTQiW55RcaNj++4SGfYJpo1RagquI3+xWny6CpK401qr0QIDKL432M84lMr9UvjpB8knRiuDLvY9GLawy0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739912297; c=relaxed/relaxed;
	bh=8jNMU8ip6rBeSpqlISiaPJWQQi8raU32gK6jMCIpWKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k3+1artu7j+KBLiEqYNzeTWdNgQS0WvkXzUEGOKS8RiJ+artIQPDPCKCAWi7mzim5W4ES26JdA47SPyhNfSIakLhPrxcXbshxCMpya5obUKckhfgN12zoKREe4Ieg0paBvyfDub5LqNK9fhMSkYpudCFuGToImGScoBvE5HPz6kzHpKpKdBs41RJTkQeWcw4bgnZIZnw0mY8eXOrGWvVhjenVRRKiOU1RR7N1UAt+xNW8TSsViO/Kxdo5B8yFBvBdxWU3baNwm//HA1tpUIw5xQkz4WxnpBmwBYbar5aj8yB0VLuPYuCnpqq6R5NAy/3iFUhQXpffWoAcogJbw4Yiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net; dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RGZ+lDda; dkim-atps=neutral; spf=pass (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org) smtp.mailfrom=lwn.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=RGZ+lDda;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 324 seconds by postgrey-1.37 at boromir; Wed, 19 Feb 2025 07:58:12 AEDT
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyBgm6lrfz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 07:58:12 +1100 (AEDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 41147411AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739911962; bh=8jNMU8ip6rBeSpqlISiaPJWQQi8raU32gK6jMCIpWKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RGZ+lDdax8qjIOiB5ZacnAgWnZTgsFpylEbMW51u+P/MIZ4iyhn77FaRGI2dDgZ/7
	 PSdVV5Ab40gE18mE/GC17G4zDapRXyDnjvtMyLX/X1z8KjuhPso6bXPWo8AreECp1G
	 98znlH/rTluOQYNBlOJ3zgZgHPpYqLWuZudgxDv3yJkDcFhOdWhqo1YhFEhOHIeY4A
	 VAIzOxV+UDEcDyE8DFXCRzajUWTxsxZbIOIWZNKLrJ8usY8w0570cRguzaHptPlgAX
	 T0ovBK0bp9qEs6SV4ZG5qi7exbun4747718D6XGCFauEWi9SsploIuqSqI6XFFY4zS
	 3PACaipur3xJQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 41147411AF;
	Tue, 18 Feb 2025 20:52:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andreas Noever <andreas.noever@gmail.com>, Avadhut
 Naik <avadhut.naik@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Eric Dumazet <edumazet@google.com>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Sean
 Young <sean@mess.org>, Yanteng Si <si.yanteng@linux.dev>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, James Morse <james.morse@arm.com>,
 "Nysal Jan K.A" <nysal@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
In-Reply-To: <20250212135808.58d2f032@foz.lan>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
 <Z6yFG_NntQfkwYli@archie.me> <20250212135808.58d2f032@foz.lan>
Date: Tue, 18 Feb 2025 13:52:41 -0700
Message-ID: <871pvvnffq.fsf@trenco.lwn.net>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

>> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
>
> I need to double-check verify this one, as it didn't appear on
> my tests. Are you getting it against docs-next or linux-next?

I get this one too, FWIW.

I've gone ahead and applied the series, but this would be nice to get
cleaned up.

Thanks,

jon

