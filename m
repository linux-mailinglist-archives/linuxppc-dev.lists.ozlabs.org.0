Return-Path: <linuxppc-dev+bounces-11676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E9B42221
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH3g54s1cz2yrl;
	Wed,  3 Sep 2025 23:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756906897;
	cv=none; b=OP731ykUpkML/NYV1B7QgLXSQacOo0oLn4RzT5pT+B/o+r1KDNOyhmxEvAeIm+ftR/aq/IQimcE1xClJraVoKX90/BzHqvHcvChcvbhqfY7OqrKrKTjPdXYkBj0dmhZ6gR78pJavvhHxOw7B9bwZgt1cPU4/4MLv807UIQfOMJquQsYN4Qnamz/N7ShQk52TWsYOW11fXKkWCoCeNjbuU4A5PJJPKS5PfxID7qXpPLrK53NP8TB73QCOvRj5uaLPHq/snE3fgtCTpKVApTdCcm+3UF/q8siVLqNxqxGe1ZKCg2hByG0sN9AUf3BJ1W4NkFaUU1B1byNLFTB290TyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756906897; c=relaxed/relaxed;
	bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+w8X0sa+IeRGXR2Z3aEl628kscDVHnIJEsaBKBN1s4fgfXbACLzwoBDhs3lgD0uzqJh43xjLfHzlf0eQj8N9K66jdol1bKhIGflPA0dxKgv932O6WfbmU3h9iegnoGDGgWFP7bGF+KDjloaZ/XmW3RbMHlP74TagbZFt2HU7SrQk7+ZtPIGl42ZNj4C5DggCxE+Ph/+vvQtDopYDJjXV9lPzAJm9+JN/e90bKU7mw//tiiBVmPSQJUyE+eqvVABatGlcZK7YWV9+tfzh4SZHQBsLHTyN8QS8vgnAPojMCXFMm3pMAMfXRHZ1BbR/ghmNQ/ShIzNIgKmFygNtMCVPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ey9WaB4H; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=richardcochran@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ey9WaB4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=richardcochran@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH3g41cKyz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:41:35 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-71d6051aeafso59267597b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906893; x=1757511693; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
        b=Ey9WaB4HO/ZjVgmDdFrUf92iaC8goKEoYR5PcobzNIpdSx1r7N2YPGLCACUP4CiGE3
         hlFaHEfI04sPcXQLoxgmzBntD1lM4Ui9bkGnB0av9QDiphZ46dFTXmfd2Pju9xKLNe1a
         hkAUXSGBq50728kjG5fmsF5bfdkJkTWx1vltu6Gj2LqxQTk1Y0/oL1w1Huwun4gxw5Pc
         QZWDlGXt2YrsEde9oyEWN2PaGenmm0fudTUlfwg8ncEjhnqYftoUe6rMmUdNG29Hef4B
         nSNYvA2r3YGOoWsx6qh+WOwrilbzxWy7L+6AC+hH+eU3vyIlSWz8nfAOGMGomj+eud//
         Dflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906893; x=1757511693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtSHdTfd+/QVVScrEVKfgAJRnBoREvz6o6zvp2ZWROY=;
        b=kDolOaEJUZ0KeZlqfF9yWJFScA8eFn9Ns9puSaH1IwmWAjxsTylxoeWCpKQO0hDVao
         VFuN5GyzSWFNZOCudSPEaKQZ9mjr5Jhf0nlHfe4bimKWXLg2LR87TahiXBy4qmLQBMCb
         Ohb6t3du9+xMnQKkIu59sd3dgL2LbwnQtbhGp4zWw4IgMV/zoABKg7ZQdpKlx1DabrlL
         9Q4UehNibRzr7NAHb7S1VEuOppuNDZUozC8JgF1R+7/ZgXsFAt4GcdfCwYH1HZk4s8CX
         DMJ647qmscQgfM4kPU3NVDWy1Ym0/kBwBRO3p7t6XtoIxVNYDiAcKzwM6Ccfk8nqZK+b
         0u/g==
X-Forwarded-Encrypted: i=1; AJvYcCVlGglBKEJCooEacwWrig/8mh/kpkJbQCJERcLiAu83VJWSkfodcLjJW+5z6dQidkJZ9hkmxV5ZVYmroiE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzn93w5g7bhXOGG2BO0kxwvocLDNWeBbyKo5d7/wLeEAac+Daoh
	lrg0g34R4iTUJmi4uZZ3Kpw2OJvIP1G2BABREca+Qn1gZ8bcX3iPQeWC
X-Gm-Gg: ASbGncuisqiT/hBCzJ9GdgItXfOtFHK8aueej4uWW2dl11DgOKTSLmVRrWhvzO56TXk
	CRctvfsXc5CRXFYI/3nW/nJVEz3GSnW6m0JjUTlxuRIljvoMQTkvYBxUMSMsFpPWfu1TFuYQg1Y
	4zYqS3NgtR355SZgyrJGYVlaT4rECdokBb24KTLKNATSnxDjbygz10ikzbKoVyR90qWfFAKDxKy
	y9qup+ZBXMjmxqU0ixyqbkK9EkaOyBx75X43OIJVkxw5/eJ9/30b0YyO4ZpqhvzcPGy1E4pkNAH
	lUlfaDKxyz6Djj644cN+tOgBYlW+ornK4+6O/OxePh8J9zkNLtpGZQirb0Ydb5MOGminoVS2CFQ
	Vm7gqUXFOOxarsU8Co4uRmXuXnNpe+APuxnDIAb6YKseEZvNEgu/r
X-Google-Smtp-Source: AGHT+IGnjHsAyQljYLZz2UQHy207mYMU6/HFTBywuxhNBv3nxCgO5MpvlVh0qFbK1/Zdh77rKiaXnQ==
X-Received: by 2002:a05:690c:4911:b0:71f:e430:666b with SMTP id 00721157ae682-722764acba5mr157076777b3.32.1756906893562;
        Wed, 03 Sep 2025 06:41:33 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8329a4dsm13556527b3.22.2025.09.03.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:41:33 -0700 (PDT)
Date: Wed, 3 Sep 2025 06:41:30 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, Frank.Li@nxp.com, yangbo.lu@nxp.com,
	christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
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
In-Reply-To: <20250903083749.1388583-1-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 04:37:46PM +0800, Wei Fang wrote:
> Some PTP devices support looping back the periodic pulse signal for
> debugging,

What kinds of debugs can be resolved by this loopback feature?

It seems pointless to me...

Thanks,
Richard

