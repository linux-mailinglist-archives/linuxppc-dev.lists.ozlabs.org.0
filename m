Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6545D6EC96A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 11:51:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4gPX1Zk9z3f5Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 19:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y863Qaep;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y863Qaep;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4gNf34Fpz3bh3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 19:50:24 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94f1a6e66c9so747309566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 02:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682329818; x=1684921818;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Is2thnxMX0NfS0ATfXggVukIP4xt06PqoAtrJstbVw=;
        b=Y863QaepaDFc/zBRlmtqWeoRVTVKKterbJixxWjJYjqZD4Oo5MOaqD2gUS2FjoyFcv
         oOvOhGMxHoosA3Ja91da4xlxUK+eGWEqATjBaM/1ScTDlK1xQR03BfO3R/XIqW5a3G6d
         XgsRpbBnJywGLuG0H1K8cp8TR/ojcU7g5jMHMmdOsp1rUDr2qFyCtuOq+Fb5/YhJL5L7
         8JKWOiqVL4DfyDFbfvYzBAvMyClfWeapNecihQbJ0pHJ4Jm5c3QIvsNWiwSygrRGyZUi
         OdvcCMf87omaBkOx5i/vXXpJCKtMYqNX370sA5eJG56xieJ4RhcHN/SWlGZFrcQA4RvD
         /+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329818; x=1684921818;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Is2thnxMX0NfS0ATfXggVukIP4xt06PqoAtrJstbVw=;
        b=UsS+Wbd0CSh/QAZx/ZC6B1/qSkLh2LrgdbudyiwIxEwTwXe8DLAEEIWbzjH/Fd3O21
         wXheljZOEshpmG6zxtMOwobI63t66gfZQ1xIoAxBA4X0V8R0TXGeXUlQcDSw0luKgZFe
         A6I+rqMN9Ei36ftCDHaSzRoISIIgR0tf55U6bZ2LW8MpROIn91LX2FHJt85+kp8i01Dt
         6gf5OZH6aqr8fHYPPJUCbu65idSRT7OSIowfsrbAoF9gTsxYwckfJt6kQamA9MJ3G8kQ
         f7m1NobxW0v9i9fxbksllWQW8xt/T6L0F8D79r0GV/rm67H3S/RLgN3U/J0ZrsC+MPd/
         hcYA==
X-Gm-Message-State: AAQBX9ff3gXi4ChVCdvC1GPHgO41bdCcnpGZayhWmlPme0lB7/bGZyNi
	qIcHkogimvrXRROawtbpwxQgHYP3gxIlhBbvlfw=
X-Google-Smtp-Source: AKy350a8PgtY0Rv9tw+XuKO2+y8O6JuUL4PcYTcSolhIOBGMSaCPgR6j0orK/qM1thAKjN0MD/AWnbDXvNKqyHQ0VBM=
X-Received: by 2002:a17:906:8a44:b0:94f:553:6fd6 with SMTP id
 gx4-20020a1709068a4400b0094f05536fd6mr9465953ejc.24.1682329818094; Mon, 24
 Apr 2023 02:50:18 -0700 (PDT)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 24 Apr 2023 11:50:07 +0200
Message-ID: <CAKXUXMziSWC9oGVQxCPs6U5GsnuA2KbKsobj1Feo_eNUn3e4dg@mail.gmail.com>
Subject: In-flight collision: DRM_AMD_DC_DCN renaming
To: Michael Ellerman <mpe@ellerman.id.au>, Harry Wentland <harry.wentland@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Michael, dear Harry, dear Alex,

The commit 4652ae7a51b7 ("drm/amd/display: Rename DCN config to FP")
renames config DRM_AMD_DC_DCN to config DRM_AMD_DC_FP. The concurrent
commit 78f0929884d4 ("powerpc/64: Always build with 128-bit long
double") overrides the renaming change for the select in config
DRM_AMD_DC, and this leads to selecting the non-existent
DRM_AMD_DC_DCN.

It is easy to fix, adjust this one line to the renaming and 'select
DRM_AMD_DC_FP' once both commits are merged. For now, I am just
reporting to let you know; probably, it is best to get a quick fix-up
patch with -rc2, once all the changes landed in -rc1.


Best regards,

Lukas
