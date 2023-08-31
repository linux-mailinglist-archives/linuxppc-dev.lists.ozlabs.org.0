Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195FE78F08E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 17:46:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m9sJMKHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc59x01lBz3btq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 01:46:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m9sJMKHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc5912yZ3z30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 01:45:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 061A260CF7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6DFC433C8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693496738;
	bh=J1cZYDRnTeF8cAXMCJ0XFEKzFUSLXJ/iqg35dWO1Xlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9sJMKHABnRVgyrpaiqO/6dri9ODMIQ2UYtcPw0s1RRnkYP9nAEi02nSlDcnZBfVu
	 dF8V9bQfD784m7vV8UNt3V0eIV1U7+y+3czS4NW3LOly5T1LiDbnS/3JL0HB/7QH+G
	 ND/7Xk0LhEEVbMllR2fDp+zaRReZaOmDIEpvign+dD4FG4hPedRR2Z5Hm7NrTH0lrE
	 bxnvUQxnYZZ7cB0ZeA9rzXEQV7Cls3FompIOVbhBiWmGlfwBS0wEhCgvgfaEeGSpGC
	 nKHUtgrRMu9rYOMCOMknC102ncMv0mcCI1WaN2y3pSQFFC3KCBOMjELtAYfODpFSiJ
	 Xx4MtQi7jaZZw==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-572a7141434so539938eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 08:45:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywft8QzLbSn8Mgh8R6uHVSDgCSpgYLiccoHwxpg+3XTWfRlpKeO
	CaMEK7zx1Vw4W0ykOG3VN5K7We7MYJmzMdovHGs=
X-Google-Smtp-Source: AGHT+IEUJMNylrks/fy5NvmaNAFMnHbg4XiCcdriY8ZpK4zEHo9Dox7bvKVqZcq4Wd6iiC2FHgRGNtjlem0M8nYGzko=
X-Received: by 2002:a05:6870:392a:b0:1be:fe7c:d0a6 with SMTP id
 b42-20020a056870392a00b001befe7cd0a6mr6668317oap.2.1693496737720; Thu, 31 Aug
 2023 08:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230825194329.gonna.911-kees@kernel.org> <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse> <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
 <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com> <202308301702.4EB6F55@keescook>
In-Reply-To: <202308301702.4EB6F55@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Sep 2023 00:45:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNARtiS5ePpq9vsQvhQs5AC_FGbsGycM1Bn9jtKvH1rRwpA@mail.gmail.com>
Message-ID: <CAK7LNARtiS5ePpq9vsQvhQs5AC_FGbsGycM1Bn9jtKvH1rRwpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Aug 31, 2023 at 9:03=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Tue, Aug 29, 2023 at 11:57:19PM +0900, Masahiro Yamada wrote:
> > The attached patch will work too.
> >
> > I dropped the "in the first line" restriction
> > because SPDX might be placed in the first line
> > of config fragments.
>
> Good call. Yes, this looks excellent; thank you! Do you want to send a
> formal patch? Please consider it:
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook


You can send it with
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>


You can add help messages to more *.config files if you like,
and add SPDX tags while you are here.


--
Best Regards
Masahiro Yamada
