Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2427C4511
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 00:52:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AY8i4gCV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4rks02Qcz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 09:52:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AY8i4gCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4rjx4Wrzz30QG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 09:51:31 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c871a095ceso46644155ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 15:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696978287; x=1697583087; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubmSWqN4/oZllpUx9ALydSh0+D44g/WNY6GMZGog46U=;
        b=AY8i4gCVgbulxfr0nivwZSE7eWJNIoQ0VtpyG0hZE6V8P70a2Q06El2WtY9PvxBmEg
         ZhbpjlC5H45JEFjoPNvwRVCESoUStzOb2XTPJpPtPQGoUaLRgtJDgYxCZfBv99k6qFDC
         XrvYyBSORz0K2bBzTp5H6FapMhIxahgpfNeus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978287; x=1697583087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubmSWqN4/oZllpUx9ALydSh0+D44g/WNY6GMZGog46U=;
        b=URot/BCthU/2eTehDig+EeKPMylZWSKSUU9RyG8b2osbdhqdR+K1trhK8WIQrHKEw0
         rTgaJeqX6icvo06UmI4LavqjIvfuqWdKAmBNcMs6RjaXkHUMKleF2vMnmESIOsGLyqfs
         d6pbuHNVEJMLFSwZYzekoMSuT79bBTzQ+aJZ2cHNGRFiZXz+9LURQYXSVKfV3rKbLhhf
         KQamFxRPtHUIKDvGQO+DDjujyTA97Z8rITKkVGg9aNZuUte+9mBmWl0tjEDKMwbitMwF
         CocXosz6ynFIdWeTEzJA6OmqoyIHV3bo0liCh/N+Jj2SJ9UIbEdQEseNVUDeaeUfeV9l
         C5Yg==
X-Gm-Message-State: AOJu0Yz5Mhp1f/yOOiCj/0AEqhlgo3SFkdVRuv5A298ZZlLzx4IzZ+BT
	Xy3XsNKoySuy509sDnwMS/Y3ag==
X-Google-Smtp-Source: AGHT+IGy+/NzfRV3ud+i8e03ChCZFw5EN81pR1ltghJlrE4aP8IIfdWDbQLD3eDks1ZvJ8So6yMflQ==
X-Received: by 2002:a17:903:2445:b0:1c7:74a2:5b56 with SMTP id l5-20020a170903244500b001c774a25b56mr20177500pls.43.1696978287254;
        Tue, 10 Oct 2023 15:51:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902c1d400b001c3be750900sm12325562plc.163.2023.10.10.15.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:51:26 -0700 (PDT)
Date: Tue, 10 Oct 2023 15:51:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] ibmvnic: replace deprecated strncpy with strscpy
Message-ID: <202310101551.DAE933A@keescook>
References: <20231009-strncpy-drivers-net-ethernet-ibm-ibmvnic-c-v1-1-712866f16754@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009-strncpy-drivers-net-ethernet-ibm-ibmvnic-c-v1-1-712866f16754@google.com>
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
Cc: Nick Child <nnac123@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Dany Madden <danymadden@us.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 09, 2023 at 11:19:57PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> NUL-padding is not required as the buffer is already memset to 0:
> |       memset(adapter->fw_version, 0, 32);
> 
> Note that another usage of strscpy exists on the same buffer:
> |       strscpy((char *)adapter->fw_version, "N/A", sizeof(adapter->fw_version));
> 
> Considering the above, a suitable replacement is `strscpy` [2] due to
> the fact that it guarantees NUL-termination on the destination buffer
> without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks, this looks right to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
