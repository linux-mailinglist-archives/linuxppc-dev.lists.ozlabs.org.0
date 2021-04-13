Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D635D760
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 07:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKF1L1XsLz3027
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 15:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QfN4WH1G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QfN4WH1G; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKF0t5cp1z3027
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 15:44:28 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id g24so11874516qts.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=Nz5tyiIHGH708W0D/VPaU8LsCV5BwCSqIoItkqU8xYc=;
 b=QfN4WH1GKnHHrg3HhXWmEGwRmW6MqQ1UGQcxr0sMQmG6wAb/1N7J0Ti5+te1TKsMvA
 6SgbonRlGyVOLYZ3nSglDMcMTm9G1kqXD4Hp3qIhdwIYEDO91bS1QJCe184Z9kP5qy/S
 S0KIBhLvXq3XHWfFa1VjRms9N9PCtvfIR4oexjx/ctsNhkgsBCVklp1Wf9oG4tiLwzoM
 LyVcJSxrKaKE7a4FDFDDwZXRvw6TAjl3cN+QDPi4UKSQssZjJLALQ4qIINQFym/cf0lx
 XFKIJrcBMwmsnkx0qPqiNrmo/myG3oepDG4tM+XiojcA2BUJ5YOb93BbB/wKa1Nz3hSp
 GIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Nz5tyiIHGH708W0D/VPaU8LsCV5BwCSqIoItkqU8xYc=;
 b=cHk3YG8XiYgGipAIBuSBaQTjwz6K/LxOa84VBw3jTeh/wzrQ1hOM6XWPv8idCv9eCj
 sBWSlugdFYVnMpVJSxPjf98CHwlQQi2zsqGr8xs60WdkPiyyV8pnPoYpdosmAD9cy1uC
 gw6DJtI6eB9GDe1s8HLUBMzRK35dYJe1Bvvh5vYc4eLsl/MLozgKdeQrpDOB6FkBCeu5
 bXvMHnN5Ek+gIhqXon6A566hax6ZfDGcwuITwASYIhcFqRx0ePbFN4p7A3/tALA9SS4G
 tp34bt5LoG9PyUmMq1TbDlfm79bSalmqFLh5unxisgwpp8qOGCPbg76F/X4y2HT+/g8P
 sXRA==
X-Gm-Message-State: AOAM533afCLItCbZhSGdbrLjb+M/vRzWzzBTJb5WeSV+yonggIgDbGMy
 64cPLhLMwzkn/OdA3rZ3I7w=
X-Google-Smtp-Source: ABdhPJxQafmCqY6h0kKpMiSqmd80+4ut1EjZ/F8NYskVxt56Wn/Z6zhxWeW6BtmBoGNZQ/oIU7i6sA==
X-Received: by 2002:a05:622a:c:: with SMTP id
 x12mr17525117qtw.95.1618292664205; 
 Mon, 12 Apr 2021 22:44:24 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id u126sm6064032qkd.80.2021.04.12.22.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 22:44:23 -0700 (PDT)
Message-ID: <529fcd73cbfaba31aa4428a0e44a65f83767ff14.camel@gmail.com>
Subject: Re: [PATCH v2 11/14] powerpc/pseries/iommu: Update
 remove_dma_window() to accept property name
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 02:44:19 -0300
In-Reply-To: <5b26b874-6f7a-ce1f-fe33-d6861f7ffb4b@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-12-leobras.c@gmail.com>
 <5b26b874-6f7a-ce1f-fe33-d6861f7ffb4b@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> 
> On 12/09/2020 03:07, Leonardo Bras wrote:
> > Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> > 
> > Update remove_dma_window() so it can be used to remove DDW with a given
> > property name.
> > 
> 
> Out of context this seems useless. How about?
> ===
> At the moment pseries stores information about created directly mapped 
> DDW window in DIRECT64_PROPNAME. We are going to implement indirect DDW 
> window which we need to preserve during kexec so we need another 
> property for that.
> ===
> 
> Feel free to correct my english :)

Thanks Alexey! It helped a lot me better describing the reasoning
before the change!

> > 
> >   	ret = of_remove_property(np, win);
> >   	if (ret)
> >   		pr_warn("%pOF: failed to remove direct window property: %d\n",
> >   			np, ret);
> > +	return 0;
> 
> 
> You do not test the return code anywhere until 13/14 so I'd say merge 
> this one into 13/14, the same comment applies to 12/14. If you do not 
> move chunks in 13/14, it is going to be fairly small patch.

I have applied most suggested changes for patches 11,12,13, but on a
single diff it still amounts to 275 lines. 
To be honest, after 7 months of sending this patchset (and working on
other stuff), patch 13 looks a lot like to read alone, and merging with
11 & 12 seems to be too much.

Would it be ok to apply the changes and leave them all separated, or as
a mid ground just merging 11 & 12 together? 

Adding your suggested text above should be enough to get enough context
for them. I could also say why the return code is left unused for now.

Best regards,
Leonardo Bras


