Return-Path: <linuxppc-dev+bounces-10664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E6B1B74B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 17:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxHBs3HLkz3blg;
	Wed,  6 Aug 2025 01:19:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754407141;
	cv=none; b=QgluelQT+yQi5M1x175jUL/iogvc1TN9kLQYXY5estcqiYttFy7Ta/dutfzYOIl1B4grp+869MaeTtmz8oMK/bsevp16z3UDchAEFiX7v5ueYaqI4rjkN0g7gFzukIcfRov4loV8wgim50d1Li6FEgOCbpH/voIh8yx0cHUCw0kYDlHUH+dZUdGdF9Qe9PfMHbo6SuOtzxLU5SaSt0uXMW2/oxhnCB2T22apFYpsNcpMFMZAisPNvvdE1XX+3OevZaQdXMqI/NOAQk/+pBm7Ga6Nw2TE9msSQ1J0ePjgscvkPjYmTx+VXaKDoF+/zDw7Ft7oCw2+ypUwB0pf7JpcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754407141; c=relaxed/relaxed;
	bh=rDMZUncdM1vNssKe3HR2+qx8a1juDqWyeBUF/Ix7mr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoyOYgbb3knWiigltSp/g1qQrdz/nuJgti72EIn5KsjZJZ6qkCrE4IZ0XyHlF2sSu52orWMuKe8v7WSzGkck74S8w0Q/Uc9D9WA3CZJ2tTeq6ZuhVG0+S2ptPwwHUvecxfPrP11re4Qjii9kaQcfuzxAFE3kRCRdW9vLnX/fjgzvUrYUaFEGMniuU1AOkOIlJ6QcnBp3Wfr9ekuD09JPniei6JISstlLvX8L+gAuj6rzB/+UepzgW1ickoD8BaJbAwPwdlF2eoZFJ+3+zh+IkRzsD31cWXRf5mSCHx4JhINECpZ5xQeGv1jDFCfcCeJmdURi6YpdwI1kzxjy5jykSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxHBr3d15z3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 01:18:59 +1000 (AEST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso8348216a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 08:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754407136; x=1755011936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDMZUncdM1vNssKe3HR2+qx8a1juDqWyeBUF/Ix7mr4=;
        b=V0v/TJwJjYX4VcYI853l8x9cxt+RXcm9wU4yJInyo+JVEJ7MedjhylhiK9TWnwO9US
         fUMXWPJiBdJjUAeKDQ0Qq2qiGkYDlvKhkSzq31c91yRuanEplPP/lkY2ix6O+g+I0lzd
         O7QKEzcAbn/gOB4hXdFZLgxIYP5TqEKMAXsugGd5xCzEpcs4OfdxD/0uzy0q9DIzsNW3
         iZHL39p4lrNNaY+KVa32kYKVzLo3DEqMu9vcPZwyXIJPeZHSUx86NjTdaTZmGgjTow8d
         8IckHB5WLntzKpgsVQgqBzrTnjU3tvEz98gRL8WoJZDjfNDFKQU8R930KbW+yKuHBgGd
         BxXw==
X-Forwarded-Encrypted: i=1; AJvYcCVwQvd1JmKyl5mkWfx5W9BQ6KL7ZIv/c276qv0UCtIyxBpCa7Q3PzADE5a9/cdguTfbPV5E4sQO0h37mI8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yws5/smmBJGTcbgX3BxzyMY+qhXe47oPiTpdkGOun3YTHhyA8Ag
	TuMR8v6oE3JlG6GQvQSUOvCvJgk4+j+OcKFExEMr6Gwd0QOgrxwF3bQg
X-Gm-Gg: ASbGncvHc+NZZGFCSuRkzeRoA/n1m0ebWZxBzc4MS8+kmbq6p5dr/fUfHmO949Lmthv
	YAqASGKK44gRWJVMH6mKFGTMfRDb5HBfSa/xLDt8eqPRiNgwb/2ijsJ/d/5Ja2pX4GLATbUMhF8
	IJY9kEnBdcv5CW0+78Z2yXOSSBaAnu2qAVUzG9qLNRggwDiKZz2nOD0sLUHOZ1KbTZKxKfqfPC6
	sVT3naZwGCkebHXzaBng2fyiy6s9/SZSy+MzccEzjgILLK3Bwb+Ev1BdeYIOZwz08LSjVSaanbo
	x5lVS4U1jE7J+umnZDfMVgH+NpHsEcTAqo4q5AEx9VOHvIl1R1W85XiEBSbxOTqphIj9G7rsV9B
	GAalqW2VFo+puGw==
X-Google-Smtp-Source: AGHT+IEPMyV1onhl1ZeZO+a2aYTU/KXXp0AZflq53hn6fSnWDxi2Vx58KPSDa3Gug99gwikwpUkEew==
X-Received: by 2002:a05:6402:3593:b0:60e:404:a931 with SMTP id 4fb4d7f45d1cf-615e6f015fcmr12388042a12.15.1754407136247;
        Tue, 05 Aug 2025 08:18:56 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2d554sm8474940a12.27.2025.08.05.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 08:18:55 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:18:53 -0700
From: Breno Leitao <leitao@debian.org>
To: Ethan Zhao <etzhao1900@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
Message-ID: <kvh4pn3bemmrrxeeaydclvhsr6tnudc3hayr6up6oeuzfwzijx@f5corx6x3h6s>
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
 <1e332191-e1b0-49e9-afa9-09e76779f72f@gmail.com>
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
In-Reply-To: <1e332191-e1b0-49e9-afa9-09e76779f72f@gmail.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 10:25:11PM +0800, Ethan Zhao wrote:
> 
> Seems you are using arm64 platform default config item
> arch/arm64/configs/defconfig:CONFIG_ACPI_APEI_PCIEAER=y
> So the issue wouldn't be triggered on X86_64 with default config.

Not really, I am running on x86 hosts. There are the AER part of my
.config.

	# cat .config | grep AER
	CONFIG_ACPI_APEI_PCIEAER=y
	CONFIG_PCIEAER=y
	# CONFIG_PCIEAER_INJECT is not set
	CONFIG_PCIEAER_CXL=y

