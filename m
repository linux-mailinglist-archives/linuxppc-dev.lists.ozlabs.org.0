Return-Path: <linuxppc-dev+bounces-7795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35852A939FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 17:41:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfJs260bVz3c4f;
	Sat, 19 Apr 2025 01:41:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744990886;
	cv=none; b=ilQo+phyXoa1tWQfWKOwjsVbEEHeEVg3oV0w2rfr9/tLRB5agbJyJ7tgtUwufIhaiaj+k8WqijtQbkUdHrhE5PuibqqNKTik0dGQCv0uPyig/CuIPqzcxcdrQBg1RxTafvoQygZOVP0m/SNh8beo0t+Zm9cqgVNAvdwY6ts/Dk+PvUCTN+1U5OSomzwxSzyEZLs79D5MO1CWwfmpkdbFW9MY3AeN0pEilThIkuE8+WUh7tDlDbmfzeGyuTWSXSgdYasHH2CAn0CJRy1CGpSox35chPGc5Y04B8j2YvR3V31XGFaU/kXocddVPP1J7NCo62mjDjPOUg+8xvmC0V4MGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744990886; c=relaxed/relaxed;
	bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyi9g+SpwBaok9lkAy0QbWpdAHbXq8qE7mBhtkF8t6+2154UN+S/D87vy4AX1FVWzMHPN3IzjvKcycIBTbY9G2JmPo1C0jP4cGCDJhP5RVc4tT+D5Nz92MmN/0SBbz13YcjSIC1Swdh5bZnVu0Avbe7Ez1Tu3gj/AiJlvka7MsEg4QQ3Kpgwcp0GFyRqaPMqAPfumfTaXvIQfxYRStwMIIFhe6VjtbZtrbVDNDj29Li5ANaiBkvSQSqvzlv5RRCmb5ftOdcTl6UsNe6QJanwaCV1cLGasWhjdBemlSlhXvopsKKSJSPjPg71oMRMwfnNoTJJg9tlclYjRlry96kPmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HttWWBXK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HttWWBXK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfJs04dJcz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 01:41:24 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so559199a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990881; x=1745595681; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
        b=HttWWBXKCg97NlIX318iv7/Y8awXsQ+kYhBV4b2eBTuVT407kUp0SSyy/ncC4yUtvE
         To6tHF2HoD9aDC3gQJmP19wWytZyAvkdchGTMexDaBRFe2IyPLrdG8fc7o8TM+WoStYu
         /HDKGegEziNq65/mhsaX5OkpkVUAW3Y8tiq9QQNUpzcHbfhfwJ0YMK3LJUNWDL5oZL8N
         zwxlMQ41yRy7lwU1+xv+VnEaSIaTSoql9YvrmUFAb5DRGvJGnOZ1Lk3L6UZOiYzaMC8S
         t84SCyx68nbHMw5GjDb1QOs3V49ktTOt1JMNbPDYWQ4M7K6aB6F10Pn6lWg+GMqd5IJZ
         cBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990881; x=1745595681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
        b=YB1vhsVzaSg7EsVTagnn42f9pFchjLhdhElqW5b2UIvz2DZtHwMWXgzPAh5rYb9h42
         /P/L2LVcb7z3PKA83EyeB8T88AChpV2fb/NDWHXLhSeoSRZp/FLYmqsup9OhZ2mtP9FQ
         7OGL3uOydhX2zRWIGM90N+l8yCK9ylh+uX1L8DD/X8ooSamW9uTd8XJZT9hrW5NO+uZ4
         057mDTTRLu/ncmazIV1Ps+PikbUUes0uQMusVDxISulVeMRvb8rd/1M/FO94fud1nvOI
         9PK8TvHnP2e2ZyoGOcBNa4LVQzUzQ2gZ9sOsp02nMutwaC98STIKlGL86UYZGZveVEQr
         4HHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4O8lvtCs9TyIR5DLYVWjsJW17zuvvqYiZ2/h36dt4y/Vt5Xbcw2iTt/Lvvvm0pcB0012Xk2YBhA/tOew=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyfOEdnnl1Hs8gKXLeWUxjL1qbUTkxdqF1GXWk38HVw1O6CN5C4
	Qm3L1mO30tO/19oVRws9WdMrqeXEI4NiPCu5r3slLk5OBkL62Ey6
X-Gm-Gg: ASbGncu1pp3uUz1vdfFxQMZ+tzw+CgXSof0LQWT0v/XGkOMdTwEVImSv0PSyOK9dWPa
	WgZNFxtI9NfB5gzNMV1rAsV0WmeHFEfgezOUbjKrkydoW8rDjvyEr1Et5MdhZGoYApGJUKiFs26
	Uo8o8GNmUpY132A0w3zXGceQjJNpez4VUCQ8+VQHrsAFRyv/YIXikcyJMNsa5AHcdsHh7wmAiUK
	QOc2j+7HwHmnYVeFIn1wDUTWyiQyi9fx3HzK+za+Neio57oElYTsGFvFhjY52HtOJWurVf9iq1R
	jH/XHbp64sYwgTpYgXqHq1ACfaPz
X-Google-Smtp-Source: AGHT+IEkRAOdwHdMRa6d2QlCY5Yrw6uQ9t0434Mw1NfnH0yIfWXjkcyamqR6CUsapH+iG9W1uhu/lw==
X-Received: by 2002:a05:6402:4301:b0:5f4:ca86:916c with SMTP id 4fb4d7f45d1cf-5f628524a18mr946596a12.3.1744990880873;
        Fri, 18 Apr 2025 08:41:20 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625595590sm1128785a12.41.2025.04.18.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:41:19 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:41:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250418154117.jcd6xxnwot4nmhek@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-5-wei.fang@nxp.com>
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
In-Reply-To: <20250411095752.3072696-5-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 11, 2025 at 05:57:42PM +0800, Wei Fang wrote:
>  static const struct enetc_pf_ops enetc4_pf_ops = {
>  	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
>  	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
> @@ -303,12 +489,55 @@ static void enetc4_pf_free(struct enetc_pf *pf)
>  	enetc4_free_ntmp_user(pf->si);
>  }
>  
> +static void enetc4_psi_do_set_rx_mode(struct work_struct *work)
> +{
> +	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
> +	struct enetc_pf *pf = enetc_si_priv(si);
> +	struct net_device *ndev = si->ndev;
> +	struct enetc_hw *hw = &si->hw;
> +	bool uc_promisc = false;
> +	bool mc_promisc = false;
> +	int type = 0;
> +
> +	if (ndev->flags & IFF_PROMISC) {
> +		uc_promisc = true;
> +		mc_promisc = true;
> +	} else if (ndev->flags & IFF_ALLMULTI) {

enetc4_psi_do_set_rx_mode() runs unlocked relative to changes made
to ndev->flags, so could you at least read it just once to avoid
inconsistencies?

Speaking of running unlocked: if I'm not mistaken, this code design
might lose consecutive updates to ndev->flags, as well as to the address
lists, if queue_work() is executed while si->rx_mode_task is still
running. There is a difference between statically allocating and
continuously queuing the same work item, vs allocating one work item
per each ndo_set_rx_mode() call.

In practice it might be hard to trigger an actual issue, because the
call sites serialize under rtnl_lock() which is so bulky that
si->rx_mode_task should have time to finish by the time ndo_set_rx_mode()
has a chance to be called again.

I can't tell you exactly how, but my gut feeling is that the combination
of these 2 things is going to be problematic.

