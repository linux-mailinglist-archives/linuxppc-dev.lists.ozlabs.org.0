Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5D1D5A0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:33:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nz9857sSzDr7M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=soleen.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=pasha.tatashin@soleen.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256
 header.s=google header.b=FKh4uRFu; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nz6L5TNHzDr7K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:31:06 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id r7so3126496edo.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vErvnQoqbf5Meaqtse3zpzTQXTThCj+PlNibNhhv2Uo=;
 b=FKh4uRFuzk6LWrSXDP88E2gJbQI+bBtvd2Vrw7lgHu5eyGOb+HDjTj2KDYFJxLUWzB
 PeZd/YkHHi25f64qU7/fLCFVGlERXsCjnxhlPRoAPpUYPCS+rmfQlU95K29FzuDaYRU1
 DB5aTnj3yrcjckhA/nS5y/+P1iauWWrbkRD5BHYJlSy71m6X61xPbEfO0sKbRrA75lmQ
 0SV5LPanC51ygC4iYuKyA1gPRqiKOWdHrmIvWhdmUpTWlJnEH8lXicDlYcgQ98lpSm5+
 cRmYG4HbwPlg1LKXAdiwuFNu/WuRc8kWB33kOw6rB15rTCvWOEmMSbQwGdErqx0Gd1vf
 3/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vErvnQoqbf5Meaqtse3zpzTQXTThCj+PlNibNhhv2Uo=;
 b=XERxE9JdA82OiBdI854bCgoyFOyQzozyhjKvgLhVMOZSjc2lZf4yyTuCmKRqqP5+xp
 pu/L9MM+WJATjALvxVsgxmeyu31tsoSUQYSmp+PXeNtwQum/f7FT07cj+39Sh9lUaCbK
 pQS2Eo1pWXqi+ABbEUsu6los6Ol8m9quuLHrTbYyB7RiVwIZOLcZuV5lMAPXym9ViZWf
 aBJWDQy44MdU1CUdm7czzQraQ5On1iUtn7DCf4jOGYNFMeSF0I66Tp3vH3WEiC017srD
 No8HlY7E0jgjjrkSI8Skeg/8dMjHINL8IF9gaaucywIBjCuF4oOgUFF4Z/dMUBufgULk
 8alw==
X-Gm-Message-State: AOAM531OsKPPJ3Y+ntlxFKnr609q77eckijEsJUoNR+a1ULQ2ZRSso74
 22SSDk/sV0PBVKq54Km/zkBTa7d07HkfppP4BGYFDQ==
X-Google-Smtp-Source: ABdhPJxVNhuoHXSVLn9PLNKxdspcJcNGGfAsekctXnv0fKnHI35D8TQO83ALfAlxb/fVSimNFlN5uGf+30lkrJL6Cxw=
X-Received: by 2002:aa7:da04:: with SMTP id r4mr4302843eds.346.1589571063296; 
 Fri, 15 May 2020 12:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-6-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-6-keescook@chromium.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 15 May 2020 15:30:27 -0400
Message-ID: <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert
 dump_oops
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>  #define parse_u32(name, field, default_value) {                                \
>                 ret = ramoops_parse_dt_u32(pdev, name, default_value,   \

The series seems to be missing the patch where ramoops_parse_dt_size
-> ramoops_parse_dt_u32 get renamed, and updated to handle default
value.
