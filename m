Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F28722C808A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:06:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkzqX4gNmzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:06:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nEjd4oBp; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckznf2MCszDqBP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 20:04:37 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id i2so15003100wrs.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=l+bcBJwqAfWV/8VZ0H6sJqPXokbgLaSpuC3C5NWipKo=;
 b=nEjd4oBpWdWxFJ8NDaehVg6qFVZA+o6g9xHYlwiea+VpvwXnNUYAOb8q4cMjPzswbi
 2ltvcewj6zjeg4Yx88T6N+RqKuy+SefVLESvpcxML3HD3TGkNDc7jKU7Wd85rOaViVmG
 vTQm91OSrmTyBwIPv1A+NfW3EHY8ZQJfKiTldrjfxnSGm4iFi6P/scfQDDFRqauvcY8Y
 hbGb5B8yLalINEbZiQ3FdsI/gcztTKO+JjxuVmX5sTrEZfhHBZbMx8qNcGkYMwogIF9a
 6eMKy3RjG5XbQu9zsEo4reY0fLYZFf77Jk/iqCq8A0Hh4QYeLlbEekzSrr6Hh8QE0/Cd
 Nkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l+bcBJwqAfWV/8VZ0H6sJqPXokbgLaSpuC3C5NWipKo=;
 b=b4LNf8ttQdUNTjKzVSIDDNj5w5WSXuedkCuU0bMNM6wALo48pPdy78JP+TJILHEcQ5
 NvOcGRcSIOvpa+ZC84slO4oaVY9nia6tlajfVyIHYgA7zJ7yJ3NJyJDuGvIMMSU/ZtR4
 6HiV41StkWGy+sKDygGxcfkJNYqmLT2xyPFDw2lUxpzelyogf80ro6k0EDjGVa8A6aKs
 +237srzq254xgkwiIaL+uGueK/mqX/ouio9Y0VlfjlqMCnHThSg0Y2K6CHOG3oEU5B6W
 AgvncpSCJgU6nvFJQVD2J/yVo2HSc9VyENwYM7NydJdvqUgp+yZc+fNi+oJlvXPFUa0Y
 Cv7w==
X-Gm-Message-State: AOAM530GPod2LorVFxHYRLom800keC+Fuge42RC502PJ6ZqK+njrSODY
 O77j5xzR8Ob86sl9zOL7JEgVug==
X-Google-Smtp-Source: ABdhPJyNLbSZ/YPgf6JxTiBlfUJEqoJbkFK9dDmE50aedq7C+CHGYGIGWy7ii1w8s0OZnG5vokR3HQ==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr27606899wrv.368.1606727072707; 
 Mon, 30 Nov 2020 01:04:32 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id h83sm24486637wmf.9.2020.11.30.01.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 01:04:32 -0800 (PST)
Date: Mon, 30 Nov 2020 09:04:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/8] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
Message-ID: <20201130090430.GD4801@dell>
References: <20201126133853.3213268-1-lee.jones@linaro.org>
 <20201126133853.3213268-6-lee.jones@linaro.org>
 <20201129184354.GL2234159@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201129184354.GL2234159@lunn.ch>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 John Allen <jallen@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Santiago Leon <santi_leon@yahoo.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Lijun Pan <ljp@linux.ibm.com>,
 Dany Madden <drt@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 29 Nov 2020, Andrew Lunn wrote:

> Hi Lee
> 
> >  /**
> >   * build_hdr_data - creates L2/L3/L4 header data buffer
> > - * @hdr_field - bitfield determining needed headers
> > - * @skb - socket buffer
> > - * @hdr_len - array of header lengths
> > - * @tot_len - total length of data
> > + * @hdr_field: bitfield determining needed headers
> > + * @skb: socket buffer
> > + * @hdr_len: array of header lengths
> > + * @tot_len: total length of data
> >   *
> >   * Reads hdr_field to determine which headers are needed by firmware.
> >   * Builds a buffer containing these headers.  Saves individual header
> 
> The code is:
> 
> static int build_hdr_data(u8 hdr_field, struct sk_buff *skb,
>                           int *hdr_len, u8 *hdr_data)
> {
> 
> What about hdr_data? 
> 
> >  /**
> >   * create_hdr_descs - create header and header extension descriptors
> > - * @hdr_field - bitfield determining needed headers
> > - * @data - buffer containing header data
> > - * @len - length of data buffer
> > - * @hdr_len - array of individual header lengths
> > - * @scrq_arr - descriptor array
> > + * @hdr_field: bitfield determining needed headers
> > + * @data: buffer containing header data
> > + * @len: length of data buffer
> > + * @hdr_len: array of individual header lengths
> > + * @scrq_arr: descriptor array
> 
> static int create_hdr_descs(u8 hdr_field, u8 *hdr_data, int len, int *hdr_len,
>                             union sub_crq *scrq_arr)
> 
> There is no data parameter.
> 
> It looks like you just changes - to :, but did not validate the
> parameters are actually correct.

Right.  This is a 'quirk' of my current process.

I build once, then use a script to parse the output, fixing each
issue in the order the compiler presents them.  Then, either after
fixing a reasonable collection, or all issues, I re-run the compile
and fix the next batch (if any).

This patch is only fixing the formatting issue(s).  As you've seen,
there is a subsequent patch in the series which fixes the disparity.

I can squash them though.  No problem.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
