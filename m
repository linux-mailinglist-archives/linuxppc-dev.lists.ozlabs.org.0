Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 348A079A44F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 09:17:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkdMN0lHPz3cDg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 17:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkdLw2LYrz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 17:16:55 +1000 (AEST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52a23227567so5218033a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 00:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694416611; x=1695021411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pifjIYv6Hyk5rsiSFmdRIaR5tzpXVSFZgH+NJpSIZKo=;
        b=j4T1wNrlzaRrUp6XD4e5unldU84jOWLBod/M3y9IsLWWVSq4KOJh+gUOjZvH7+upuW
         1IGEQOxR4jL3ChmDQekVQtVccXMyFjINRhsivA3752Vz+dtFKBmqzf4A2Qn315fv8eff
         gYHEVcA7C1K/aEBbGMSDyFg+4WPB4p++PFE6v/HapgpUKvyUklvu+OAiMsQuK6OlqCzK
         IY4nF8Wp2e4mUwrE5jGdD8b0jogcrlN1AOOKdCX+Ghprn1vwgHjCkYsso1mN3Rhnvss7
         9d8wmbQarRPyJBkQw+IitEYDBvL/N/zFSxgv7ttCRGGNjfBwr6+vg/CsSQ4Js1Cb4Pds
         nKPQ==
X-Gm-Message-State: AOJu0YwKXAU2XEkgyfuPepUz87jYLtAZ9EFvBngqzflyYZVJqQCeP5FM
	KeCWfUjptN/Zipb+ROpuB8M=
X-Google-Smtp-Source: AGHT+IF8WwlA+cjc7QZ3b7ObgufEBSdtFZ7KGlJIYi0Vw11q+BUCebVWj2pxlmXKlPh+iGDNpddDFw==
X-Received: by 2002:a17:906:31d8:b0:9a5:b814:8254 with SMTP id f24-20020a17090631d800b009a5b8148254mr6660837ejf.24.1694416611007;
        Mon, 11 Sep 2023 00:16:51 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id x1-20020a170906134100b009926928d486sm4848237ejb.35.2023.09.11.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 00:16:50 -0700 (PDT)
Message-ID: <9a3ed34a-10f2-c778-501e-8be600dce167@kernel.org>
Date: Mon, 11 Sep 2023 09:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] tty: hvc: remove set but unused variable
Content-Language: en-US
To: Bo Liu <liubo03@inspur.com>, gregkh@linuxfoundation.org
References: <20230908061726.2641-1-liubo03@inspur.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230908061726.2641-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08. 09. 23, 8:17, Bo Liu wrote:
> The local variable vdev in hvcs_destruct_port() is set
> but not used. Remove the variable and related code.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

-- 
js
suse labs

