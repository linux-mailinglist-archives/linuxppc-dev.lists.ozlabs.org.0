Return-Path: <linuxppc-dev+bounces-1743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B498EA8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 09:40:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=msVjPsQa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK3Vh3h04z2yRC;
	Thu,  3 Oct 2024 17:40:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727935019;
	cv=none; b=Y5Xi8AqcImNb+USYfP896tS9d+PMDghPof1awWFXGMBhw4pqNX6xvKc3Z9iW5UJ0jQ/CeKKV0eomvjeZ2nGZcEXKY0W2XnZSjcq2yJsJz0NcTMFwpenTEvWZAfzo8gNrzQk7EBN4xyWlnFsSaM5bXLQwLOVrpDi1CPzoyqdPkyFt4zB9askpZsHQj+XWxE50gFY9+dBQU1WPqAge25j2XheO5AMYTFnRXRuF7Otw9t6chAIUMiGhxF9u5q6+yqxNRaqaFStPCD3+5Z6xKJz1TmPOChf5uabBu7Ve2LZolLTeXsRiDIVyCyJSe7vbP7gbTBeaFCkWj9Yvm3VOd5BQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727935019; c=relaxed/relaxed;
	bh=M5sZr8kVTGEtzRoAeFfcsUkXeKf0SJMvytdAssiPvdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pjhyremi5AMmFwrkeWEDCCPoCrj4TPTGJCfFkgQ0Aq1MsFdXHoas0VdBbQefnCLZZ98yIz4ehgMj9GNTzNRwSv/jSBaiEM0+bmd+GMrNYQLO5DonsejRLoE/LKbIF1x12EUEHGjnIAd864DGnwpE/BqQpPCcsCVR+L6BOOeQIPoeXK5ZKBLTAadTJleZXodITz+qNuCSoUEY0Tekmj2IXmUop7X+ckZxZmDCGcU/kO9sXV/+/FGJt1rADs9LVeT9B70Tav1sRMe5mnjekDVlRQHDomDcpzYO8oGsPjqgAcLkQvfj5bjGYlRNLrxsnlP6VKRnJC6d9tuKkKPGfdF2Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=msVjPsQa; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=msVjPsQa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK1CY1lDKz2yQ9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 15:56:55 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so4976715e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2024 22:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727935008; x=1728539808; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5sZr8kVTGEtzRoAeFfcsUkXeKf0SJMvytdAssiPvdw=;
        b=msVjPsQau33RaSxvMgx26Wv7Wk09qR15BsiXR5vipNx8Y2ZHyzeBh3siS38Xk6NETN
         pStqu5armg3MoKZas4G6+Am3Yc+h5Mxnix3OkUjc1OFirM8gEQjsySfCCsKFhF6Z0OZ9
         e0Jp5h56rvnnEbYD2YfLLkmW7OlE4tEkUpCBc0Lo2uSwEnbEeDSyzeh6iVe6vHmRmRIZ
         13NfWd2d8Lksy+IPF1aPFSrt39j48OmooM6QmrSrN8alOMuTLFTHMbrZJ4nm6fPRCcnJ
         VcfALVWQIQaV/5+V4F2fX5sa097l09tx9QW/xbptgN56Fx4CTKRk2T26XgPVLvcMcHxL
         RVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727935008; x=1728539808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5sZr8kVTGEtzRoAeFfcsUkXeKf0SJMvytdAssiPvdw=;
        b=CsZsODj99czxzAuomDOluEdU5ZkYR0l/3mPxgMKdR3ibo+O6CYE7dGB2QqDAUGvJEO
         MVifSHCilM7HS2JWoGpxZ+2A+nzwcZx8AYQ/1YNFccyM2zcApNxVPkY+iE/ntFbWo9aJ
         FiBihnJFWsDSfBzpsSt4atyYbCmrPj76JkQsZT43KCkk7ewcjNCz1ZYXLqTWaT/TIN/X
         hr8vC3NrESsPgUCErXsosx6n4FzvWVIb+T6yQZh0xmKVBKuiHzgvE/xVzsUYXDl1XlKJ
         DPMIL54yhZQf8xHfYTrPlq/kUwic0axu3y+DWOqXOGl9XiQm1V7vh685JaJNdut//oKK
         ip1g==
X-Forwarded-Encrypted: i=1; AJvYcCX2t2GerAMwar8yJOTx75+XwIRJOFBqy0JAQ8YkCCJVtB51scSD4WQffrPi7sCwaZH2Eu7MGno2I3pBY2A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjLB8TUvV0Opab0k/0iS2fQ/TYDc39Lm4QQBf/datMk9hXRA6A
	1qvy9JMyHTxpGuAjimON+2RuoCoPQ2uAiW+e6UVu4FdMq7lesWCKXlFr/ps1tJU=
X-Google-Smtp-Source: AGHT+IEAQ7vgs1gj+ETBdYfXrCS6c1Fp2NHSUwSlmfV2FP/70trlY9ue+6G9YkrG20AA5sv1yjYHMg==
X-Received: by 2002:a05:600c:358f:b0:42c:c003:edd1 with SMTP id 5b1f17b1804b1-42f777b99b0mr41468065e9.10.1727935007902;
        Wed, 02 Oct 2024 22:56:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a02eaccsm35231745e9.42.2024.10.02.22.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:56:47 -0700 (PDT)
Date: Thu, 3 Oct 2024 08:56:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
	Jani Nikula <jani.nikula@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Mackerras <paulus@samba.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] powermac: Call of_node_put(bk_node) only once in
 pmac_has_backlight_type()
Message-ID: <34233c4c-1f61-4bc6-aeca-9f5faba8509e@stanley.mountain>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

First of all, the change is wrong.  We can't dereference "prop" after calling
of_node_put().  You have to be a bit extra careful reviewing Markus's patches
because a lot of the rest of us have blocked these messages so you're on your
own in that way.

On Wed, Oct 02, 2024 at 10:43:46PM +0200, Christophe Leroy wrote:
> 
> 
> Le 02/10/2024 à 22:02, Markus Elfring a écrit :
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 2 Oct 2024 21:50:27 +0200
> > 
> > An of_node_put(bk_node) call was immediately used after a pointer check
> > for an of_get_property() call in this function implementation.
> > Thus call such a function only once instead directly before the check.
> 
> It seems pointless to perform a put immediately after a get. Shouldn't
> of_find_property() be used instead ? And then of_property_read_string()
> would probably be better.
> 
> Maybe you can even use of_property_match_string().

The of_get_property() function doesn't do a get as in get/put, it just finds
the property and returns it.  It doesn't bump the reference count.  It's a
confusing name in that way.  The The of_node_put() pairs with
of_find_node_by_name().

regards,
dan carpenter


