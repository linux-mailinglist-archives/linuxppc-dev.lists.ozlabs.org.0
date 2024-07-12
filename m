Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4616192FBDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 15:53:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLCjj0MSQz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 23:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.45; helo=mail-ed1-f45.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLCjK2xmvz3c47
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 23:53:07 +1000 (AEST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-585e774fd3dso2799961a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 06:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792384; x=1721397184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nM9ZZaS7zEh5VH7vpWzHeJauviA6kuXXb6GAmKaWqo=;
        b=Kcp4UvsxatNfy0773/Z7KcJiJlJg2msdyEuRNqueex3rHomdJz9GnwKwGIyIATQG7s
         kQ6z+q1Dwz483jPVcjhs9XEOf9BwhwJC553UON/R/EbQp3+JlBJ1ppul0xmr8Eicrqwd
         STbJmEvMI5+hoOAIa0Oj63cSF5N83OQ3d7wI7g5Hpy9YM9xDkNb/UhdeAWYmesJl4oKn
         J0Gw5CtatOlSCAQeyZ3oOOGrzH/+48POjvRwyqtC2YDfnMzVIyQWOFkHMyN0njH+3x9K
         GSe4AilLOvk8lizrPpDHb2s6MD/MLp4J6InUmVzR5eLj3/TiD1HO9T9qZUdwYb4b3RSw
         PEHw==
X-Forwarded-Encrypted: i=1; AJvYcCX+4OdDM2ryfnOVly6dv/SEqAjM+i3u1Lmoktg8dJkNTiQNSm/38mu0ivCuMQgLPLi8J4HkcWiLUxIDknuiYH5d1EwVFCUH2KVY76x6zg==
X-Gm-Message-State: AOJu0Yz3iA1c0hNiXhjZPJUcbbhcJ4PjlQxguqzr7tgZ93H3l5Iv2sTy
	OB1GOIgOG1xXFtHW6TzpRUJlufkwFqrv18Jxe9VsSIVxnjaWbNMq
X-Google-Smtp-Source: AGHT+IHbRkYceFQ+y9i5wL92DTMDBFZU43kjo/0dzAA2E7wBDXKD7X1+A3oUtgIcQKPoDAnsgKaHbA==
X-Received: by 2002:a17:906:b319:b0:a72:676a:7d7b with SMTP id a640c23a62f3a-a780b688906mr933166466b.9.1720792383756;
        Fri, 12 Jul 2024 06:53:03 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bcc52sm343007166b.4.2024.07.12.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:53:03 -0700 (PDT)
Date: Fri, 12 Jul 2024 06:52:38 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next 5/5] soc: fsl: qbman: FSL_DPAA depends on
 COMPILE_TEST
Message-ID: <ZpE1Jn5ZbQikAHmI@gmail.com>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
 <20240710230025.46487-6-vladimir.oltean@nxp.com>
 <20240712121400.bnjcexqpqgjhlmuc@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712121400.bnjcexqpqgjhlmuc@skbuf>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 12, 2024 at 03:14:00PM +0300, Vladimir Oltean wrote:
> On Thu, Jul 11, 2024 at 02:00:25AM +0300, Vladimir Oltean wrote:
> > From: Breno Leitao <leitao@debian.org>
> > 
> > As most of the drivers that depend on ARCH_LAYERSCAPE, make FSL_DPAA
> > depend on COMPILE_TEST for compilation and testing.
> > 
> > 	# grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
> > 	29
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > ---
> 
> I don't know why nipa says there are 800+ new warnings/errors introduced
> by this patch, but it looks like a false positive (or I can't seem to
> find something relevant).

Right, All of the warnings are basically a set of MODULES_DESCRIPTION()
that are missing in other parts of the kernel, and not related to this
patch series. None of them seems to be in the network stack. (for
context, I've fixed all the missing MODULES_DESCRIPTION in the past).

nipa also complained about an unused variable, and we have a patch for
it already:

https://lore.kernel.org/all/20240712134817.913756-1-leitao@debian.org/
