Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F47D11EF81
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 02:29:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZVM54JYwzDqlX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 12:29:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZVKG6CG2zDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 12:28:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="urN4yCff"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ZVKF3jXmz8t1l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 12:28:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ZVKF38S6z9sPh; Sat, 14 Dec 2019 12:28:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=netronome.com
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="urN4yCff"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ZVKD1FHNz9sPW
 for <linuxppc-dev@ozlabs.org>; Sat, 14 Dec 2019 12:27:58 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id b15so594452lfc.4
 for <linuxppc-dev@ozlabs.org>; Fri, 13 Dec 2019 17:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=ScGB0uaG1N2MTFqjHS89TM7sGKsmj+KybyTlxQc+/kA=;
 b=urN4yCffQ5LSBNl1Z4RFIiOkL8cXsodyn7ff1+7ETynmlW15+okWCxijdAyaukz+TO
 gUdfs3pV9ISDCVljmx0R/i3DGQpeHwB6lMvRZGHcBkjjXGodeeGo991HuSzupHSswROS
 sS3bmtwrvuY/yIQqIKi1nsTc2BTtcnTD9FUfuu6L87zy+XI5oLzdEPkSSTRUj2jRt5cK
 sTRIVLwSZfAsTPyvAifl7PA80V+1eS0kgmmfaBZIzOHj5S4J6CLjaOaid6I8t8kX9US+
 MDKiaJ9+9Q7Zpcb2gcyR++s9kvrSn0qyJwtaSpX29QzCX/skTVwfoDYDvveA6Dh+iTlk
 +bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=ScGB0uaG1N2MTFqjHS89TM7sGKsmj+KybyTlxQc+/kA=;
 b=nA13EFEPUeNOw4x1s9QKhlr3EL5TA25TvLMT/jhhW7URkshngqW2t14sxkIBIfThEv
 TC8ej1EuPi0cA3qy3vBhaQv5DR0mG38UFaHDkYpfeor1xBOh+FF2i8QiV3DUo5ReiLTO
 60n7HYRdgPVnxNWFbzw4BEUakwDBvwYdr0/aq1k4WLhhN1UjKDFazdwP9Lw2FkrmTbMU
 lDGnRQEyo4ODQQHWGvtsfbrxkPBEuBzrzVyJeGrEe+tKkDZjiJAw8pP208SRVauWBWvj
 QNBPzjnD9KYPKviOlUkQZZeDqd7nPvZq/hRLlZsWwPjtyA/7Z+dMxbu9IG4DNe1VupQd
 6bKw==
X-Gm-Message-State: APjAAAWfmnwSd+z1IdYfAzwFZlFS82Ko6A+Qbp8I7u08W5ZjAYVF/v4E
 gfxIDHiM07S0HRjgaEVgwww4Ig==
X-Google-Smtp-Source: APXvYqw7i7YpZIaz4MAOWDRHBsmcdAJkes1rruFV67i8zLlUBMNNDl+QBJYn9uaGrpWJqtY7TYFyMg==
X-Received: by 2002:a19:c648:: with SMTP id w69mr10408468lff.44.1576286874277; 
 Fri, 13 Dec 2019 17:27:54 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id v2sm5669883ljv.70.2019.12.13.17.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 17:27:54 -0800 (PST)
Date: Fri, 13 Dec 2019 17:27:47 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net v2] net/ibmvnic: Fix typo in retry check
Message-ID: <20191213172747.5e5310c9@cakuba.netronome.com>
In-Reply-To: <1576078719-9604-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1576078719-9604-1-git-send-email-tlfalcon@linux.ibm.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: julietk@linux.vnet.ibm.com, netdev@vger.kernel.org, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Dec 2019 09:38:39 -0600, Thomas Falcon wrote:
> This conditional is missing a bang, with the intent
> being to break when the retry count reaches zero.
> 
> Fixes: 476d96ca9c ("ibmvnic: Bound waits for device queries")
> Suggested-by: Juliet Kim <julietk@linux.vnet.ibm.com>
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>

Ah damn, looks like this originates from my pseudo code.

I had to fix the fixes tag:

Commit: 847496ccfa22 ("net/ibmvnic: Fix typo in retry check")
	Fixes tag: Fixes: 476d96ca9c ("ibmvnic: Bound waits for device queries")
	Has these problem(s):
		- SHA1 should be at least 12 digits long
		  Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
		  or later) just making sure it is not set (or set to "auto").

Applied to net, thanks!

> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index efb0f10..2d84523 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -184,7 +184,7 @@ static int ibmvnic_wait_for_completion(struct ibmvnic_adapter *adapter,
>  			netdev_err(netdev, "Device down!\n");
>  			return -ENODEV;
>  		}
> -		if (retry--)
> +		if (!retry--)
>  			break;
>  		if (wait_for_completion_timeout(comp_done, div_timeout))
>  			return 0;

