Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D678E3B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 02:04:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UofDTBQE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbhH64bQxz30fK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 10:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UofDTBQE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbhGD4vQPz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 10:03:46 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-56c2e882416so267917a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 17:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693440223; x=1694045023; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6VbAFF+mQ3qo4IqvELdDEKnEePt5q/NF9cOLJ4fQs4c=;
        b=UofDTBQEN4+syQu+8W1FXeIOMZAOz6QJrDvS5d0bX7LU/n6jR37CWRrbmdHXbdJAU7
         QlylGL3DHVFJ4+60sc1BzVbKolBXdzLLP1SPHfWoOdJc631vpyPDO5ox2I0axr4MR9xt
         VcurCWfk0wtJwD7metAWBV+VSy875cHRMoswo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693440223; x=1694045023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VbAFF+mQ3qo4IqvELdDEKnEePt5q/NF9cOLJ4fQs4c=;
        b=bzVu1ThEtoN8cvv8GQYHxjCwDn+XEP696oY4cufTjY+kwFuKskvE++nT5aiWqN7P6C
         sCQYM/inJZzGuqIFqT+WyNGW5QB3fsywBbTPYkxX57xNrNcTHeNQkGDWc1adu2swLuBG
         FW9lxRDiXKlJY8h6FDzCbcd2V9TWuucA9rvWnqO03JyCAHzHYVRX2cgoYD7ya8GCywpS
         f7ctbBywxUqFCtX40xL+VvVN2KnGgQTqGjKACzGiGuWVgd06qGIotSzeR5P6Uem98c6t
         t5FrVFpuSD+Kawu+t6+jlpeefe6F5d7Ng19o95whdAwSB9wq4Xy5yQ2t0sOUf2cTFFmp
         N5IQ==
X-Gm-Message-State: AOJu0Yxvw77lHhwGvK1OxNq6LRFKbEanIRE14WsRgxunGFoh9OxBO3Ka
	/UldtNXgTG6hyfvg/6M+TFqYBA==
X-Google-Smtp-Source: AGHT+IGzXuhNKvCDESQE2QRrtYZBrvFQDlCXvQaZKzcZ7GFJqvb5A0aJYkymW5POHQPY6ycQWRimsg==
X-Received: by 2002:a17:90a:fa88:b0:26f:4685:5b66 with SMTP id cu8-20020a17090afa8800b0026f46855b66mr3639939pjb.8.1693440223411;
        Wed, 30 Aug 2023 17:03:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ft15-20020a17090b0f8f00b002684b837d88sm152885pjb.14.2023.08.30.17.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 17:03:42 -0700 (PDT)
Date: Wed, 30 Aug 2023 17:03:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308301702.4EB6F55@keescook>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse>
 <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
 <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 29, 2023 at 11:57:19PM +0900, Masahiro Yamada wrote:
> The attached patch will work too.
> 
> I dropped the "in the first line" restriction
> because SPDX might be placed in the first line
> of config fragments.

Good call. Yes, this looks excellent; thank you! Do you want to send a
formal patch? Please consider it:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
