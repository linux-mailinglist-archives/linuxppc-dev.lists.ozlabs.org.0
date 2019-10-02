Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A4C4610
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 05:15:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jh9F52DWzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 13:15:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HHYHQ0sd"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jh7S23WZzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 13:14:11 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id z12so11087627pgp.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2019 20:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=dNrBWqY17HOU7i+v4d28gaoFx1NCnnxhecJnMM4pHpY=;
 b=HHYHQ0sdtwzEbVvpcjLopixlQzov+upFPqJMs+g38mS9eGogSHYDO04LT/sM+0PmgK
 lgNoWSUADzyuHaaLrKh4O4BkyG8H7Rb8gWhm3GanegVuKbaiI0Zd7L0uTQpc6cYPtc71
 zUpl/Bt7zv+rGSRtCMTu8fcrvnfasjbZIbTpl8tBkxzAoKtSQ+JlwK6eNTQ9EvpTpUEA
 usdxrXOiPiP9pK3i2SNl/k3IirifpNEJRk909l20V+YEVVqNwWf/FiKT+YAlohY6n5d9
 vSfY1012DlkuQu2/nP+ro9tp93HmUjRSajAVNip/SwQyIfacPr0ibhlFN78RDiHe5u4Q
 xYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=dNrBWqY17HOU7i+v4d28gaoFx1NCnnxhecJnMM4pHpY=;
 b=GwKbehcrBD4qO9m2scR9SmSNyFRYdWrhj/6o4vEUDhxLLZSmEasJ01IYanBZRmh4F7
 4+kE4XCnFAUZIb6l+pyDABVVpHznv/qFsJKlp0kw8Lz7J+sB8bA0Z2B75lBrQcjHD199
 49VzNAmx6X3lBilLcqP9HfeLSbR6jJW7lTASLHfKbPcQbU5OckKPP1Ah82fLObFSoAjN
 ZzUTRNERKAy9KtO72AZCC9yfOEzgGz7doaWyrdEvAczQwA9OrKEytDR7af6kBCTKO66i
 li0mZSbZo37IJiMZxTn27Ju0clk4u0KL/ABKPSLLXIL4gtnfgaGEm9/4zQZLapx2Ap2h
 X1KA==
X-Gm-Message-State: APjAAAWtKOGYgcy4hEDN2t6rAfegboorLDfLIZoyzEZ04XfLExFm0F6d
 7TBApDdcA15iG1yKacHNTqP0OiDB
X-Google-Smtp-Source: APXvYqwDYSJA3yQm99nAjRhI48uYondA5FmSv10DvLL/2TC8hq+86FvVlgoyUZJW7sB5pQSswoMcYA==
X-Received: by 2002:a17:90a:e56:: with SMTP id
 p22mr1672203pja.133.1569986050106; 
 Tue, 01 Oct 2019 20:14:10 -0700 (PDT)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 71sm21690985pfw.147.2019.10.01.20.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 20:14:09 -0700 (PDT)
Date: Wed, 02 Oct 2019 13:13:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 00/27] current interrupt series plus scv syscall
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20190915012813.29317-1-npiggin@gmail.com>
 <20190924093302.GF18205@kitsune.suse.cz>
In-Reply-To: <20190924093302.GF18205@kitsune.suse.cz>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1569985904.hg681u0c78.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek's on September 24, 2019 7:33 pm:
> Hello,
>=20
> can you mark the individual patches with RFC rather than the wole
> series?

Hey, thanks for the reviews. I'll resend all but the last two patches
soon for merge in the next window.

scv needs a bit more work but hopefully it will be mergeable as well
but I will submit that afterward.

Thanks,
Nick
=
