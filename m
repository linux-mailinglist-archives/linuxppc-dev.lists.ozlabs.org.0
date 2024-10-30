Return-Path: <linuxppc-dev+bounces-2718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C59B6044
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 11:35:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xdk6C01Njz2yb9;
	Wed, 30 Oct 2024 21:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730284514;
	cv=none; b=AusvUs9A+IOmQAnYXLU0AayZuBEnv2E7w5brdJbmsHaQ1dTtETew/y33O/8zolMMS6aBX/L+g76YXJuBAfj3sQEG7Vq7K6tjhB+Xa2ZPKrTZVvAUk47UZqTSGFsjLW7W3Bn68MLJgSHuSC63szw9X7nt5f2gSBSGAIKr/8399X2sf46VB/ZnzgBU8ujSo4U1NqKoih/H4Op4vzcAKJNCsP0GHejGHAPj+IDCffxop34O5BHQF9eFOW5t9LstBfcz1WDqrxOgbFLrdFt0EoJdrZd0qyA49Iry9iTOTeE3pkXLBV5AJzeGi/DfFnYpk2U0vYpYIzlhm/CHMIelFOQ06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730284514; c=relaxed/relaxed;
	bh=GifnlPtN7NiyeZMSkjEx+dbPyN49ofS66QMTyEeTgtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HT0lE5sdR+YxHnPR4p4FM0hPurcFwKHt3s2iMIBSeijM57lygIY3tDI5b6Y+pFkIVIYMLyWGPwUrgxsSKCoyjIbM0RYxJVKx/mAAcA5CPb25i0WPgGJXTRKZGa745+ffL/3pnB4eMkUJ0qILgiyLdw1QTn9mG8mBciroRM+9jKLQh+B7qqDpCgdrRZkmRKrxdfi/MPfeCVqjjxfBmWJuh/HdLlvyD2xZCP1jggobzdp2seziZHDVtGQjqz2RLKNA3viUEk3H/dhE0bZ/ci8Uy45xyqI2smgrUL7em1Pj05bdnAQ3mlXeA6T2oZiA2LNu7qvLOGNlHsr9xq2PaYFbOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.46; helo=mail-ed1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.46; helo=mail-ed1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xdk693D7kz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 21:35:11 +1100 (AEDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso7512181a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284508; x=1730889308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GifnlPtN7NiyeZMSkjEx+dbPyN49ofS66QMTyEeTgtw=;
        b=SuDoKkU2gQ4xYykHVQpAlwM9EOHD6RAKs1mXpIkuIzTYuHD3btQug2Ns8pRMxGidmH
         3r9wmyhN++oqb73diAJ+icreuQg9SrgAvWGBfBIiCT7S+uGcbPO/N1eonFCPvxVRZJMi
         TVRn1zS/7DkJ4uTRAQETGEsazMw6TYn5X4ZhYzR+5oO5HaITrFQ/lYs3eK14UobkeQUg
         Moi6rDDLVt4bQMPpP4Wol8KwVos08W82/i5yn+Ack8rAo9QCRlxAu/gwwmmqdNHCWzL+
         +SbI8CGGefbygZEGjuQsr7ACsE7UPb0NagRjm1X4IXQaCmylN1ofJoGmXl5CiYhl/U+J
         w6sg==
X-Forwarded-Encrypted: i=1; AJvYcCWnlhwSAwp9xdAw78EAo3TSeBqD8iTfbpDE+HQ5qOGJWMD8l2g3zEXNOF0qjQuJXBPFjYs9XnGv6c911D4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySjaYbLdLTI/0KQQrTMR+7exUKNhZ4j66oJJltSSUH8XeJxEfp
	ON4jDCtBJvp29BGh7vIcXmoS+y5eDAVDfCWfWHL0rv+Y9Ak2dvVy
X-Google-Smtp-Source: AGHT+IF71lZKKH1Wi7ha9ca6zPk452ASkUG+FwwI2pKLbi61y6FlJ0tkir1WgK+psYexHGdJGCQKxg==
X-Received: by 2002:a05:6402:4403:b0:5c9:584d:17e2 with SMTP id 4fb4d7f45d1cf-5cd54a7718fmr1809727a12.3.1730284507741;
        Wed, 30 Oct 2024 03:35:07 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-113.fbsv.net. [2a03:2880:30ff:71::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb629f338sm4590147a12.35.2024.10.30.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:35:07 -0700 (PDT)
Date: Wed, 30 Oct 2024 03:35:04 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: dpaa_eth: extract hash using __be32
 pointer in rx_default_dqrr()
Message-ID: <20241030-lemon-flamingo-from-uranus-35f6db@leitao>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-4-vladimir.oltean@nxp.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029164317.50182-4-vladimir.oltean@nxp.com>
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 29, 2024 at 06:43:17PM +0200, Vladimir Oltean wrote:
> Sparse provides the following output:
> 
> warning: cast to restricted __be32
> 
> This is a harmless warning due to the fact that we dereference the hash
> stored in the FD using an incorrect type annotation. Suppress the
> warning by using the correct __be32 type instead of u32. No functional
> change.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

