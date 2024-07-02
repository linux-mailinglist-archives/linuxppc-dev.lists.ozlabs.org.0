Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6E923F0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD3lJ4WWfz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.43; helo=mail-ed1-f43.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD3kv5DbXz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:33:10 +1000 (AEST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58bac81f419so864713a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2024 06:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719927185; x=1720531985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOkvdQtYmcqAXVFGO+c6RVoHQeZLdjxmxpP1HWTNTBU=;
        b=q1YEcAwiBg3tVd3nGeuyZduS7umdtV7I8n0P4yHzBoCtJaQ+pe33Q3vO90+9s0PQhc
         wpMLLyQehmJHgLaqVuEF4D/d2/IosX2ZH6HtcAi6/MslA+g37Oc/Lg4sgSuMeMVj0Y4j
         gYEgdFBf8+iiiT0uCuMP1Xo62fyC/vKadEKLXXjqRDodLMront0LgwPnHqRKMgm5rj1v
         4zp+r2QhKV9/ktDX3UKv2Pe9uvKDoFBweRCZ8tgN3NkwhYadmNHu+BtJkwn6knZYHrVC
         xZLbKaYQhAi3DgofQTxVxPkdoC1U9Jso2K72cOyzsYMXqlEaBcZ9qQC834QsLEripoOo
         6i9Q==
X-Gm-Message-State: AOJu0Yx81IDDnmz1WgXmnnQ/XoSbAfoXlA8SqKtqWF3BtQi144V6+HZF
	DMSrjE+0GBQacYmXN9obLYQmChXfMCTDoYeXCjku24sqWulQx2nGJOroRw==
X-Google-Smtp-Source: AGHT+IFMraYu2aPoIooLadmuA03EaJnzyv4zAh2e17tIjIYQudbaWZBo6EOFt7y8sosj3E7OdYQHRQ==
X-Received: by 2002:a17:906:ca41:b0:a6f:5c1a:c9a6 with SMTP id a640c23a62f3a-a7514441505mr563250166b.62.1719927185331;
        Tue, 02 Jul 2024 06:33:05 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-005.fbsv.net. [2a03:2880:30ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0b84e0sm423799466b.210.2024.07.02.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 06:33:04 -0700 (PDT)
Date: Tue, 2 Jul 2024 06:32:37 -0700
From: Breno Leitao <leitao@debian.org>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH 3/4] crypto: caam: Unembed net_dev structure from qi
Message-ID: <ZoQBdcpaI4q9Fj3r@gmail.com>
References: <20240624162128.1665620-1-leitao@debian.org>
 <20240624162128.1665620-3-leitao@debian.org>
 <20240628163226.GJ783093@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628163226.GJ783093@kernel.org>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, netdev@vger.kernel.org, Pankaj Gupta <pankaj.gupta@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Simon,

On Fri, Jun 28, 2024 at 05:32:26PM +0100, Simon Horman wrote:
> On Mon, Jun 24, 2024 at 09:21:21AM -0700, Breno Leitao wrote:

> > @@ -530,6 +530,7 @@ static void caam_qi_shutdown(void *data)
> >  
> >  		if (kill_fq(qidev, per_cpu(pcpu_qipriv.rsp_fq, i)))
> >  			dev_err(qidev, "Rsp FQ kill failed, cpu: %d\n", i);
> > +		free_netdev(pcpu_qipriv.net_dev);

> Hi Breno,
> 
> I don't think you can access pcpu_qipriv.net_dev like this,
> as pcpu_qipriv is a per-cpu variable. Perhaps this?
> 
> 	free_netdev(per_cpu(pcpu_qipriv.net_dev, i));

You are absolutely correct. Let me fix it.

> Flagged by Sparse.

Thanks. I've just added sparse to my development workflow, and I can see
it also:

	drivers/crypto/caam/qi.c:533:29: warning: dereference of noderef expression

Thanks for the review. I will send an updated version.

--breno
