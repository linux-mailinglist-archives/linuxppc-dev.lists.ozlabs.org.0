Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F723770C1D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:48:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=g7Yvrn8i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHgqq5Sqfz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 08:48:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=g7Yvrn8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3eydnzaykdhqkwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHgpX4g33z2yDC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 08:47:48 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5844e92ee6bso27028277b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691189266; x=1691794066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6tuWqEnyJSC5e6pWov8J90I61X00yfI6yYMjidRy0tQ=;
        b=g7Yvrn8iSMnCj4SuV2yrtZRX2OpYiJGTlIhSEmmtv8ehUJHaNA9hhBocjtXpUpgbxN
         vhFfvXm6x3FsM6AlfhY2Kwyj2q/MN9VrNdTpIKw7tIANs0Zg/j/0D1qc4t5QR8Q81FK4
         9/54nfjgATi5+rPXrlNFoaJxIjFDn2iNNZQ4qdKPShZdW7QS67Gsor8MpFhCLAm1hYAY
         acdCN9Oo9Z7LMVFmGDIkNHaZRpGT3SR370RM4nYUWvyO3cGGQcD+VmseCdnCRbNUwgNR
         n22aG/2qshigvW9vFtHcBSrIWq48Yw7Hgpkx+lbFJnrOXFpot8IRhMWuprCSU4u4wUGN
         lFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691189266; x=1691794066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tuWqEnyJSC5e6pWov8J90I61X00yfI6yYMjidRy0tQ=;
        b=HLKmnXiENGAPVa10D/eXQL3bnKtHetGJPWFSUkXFTgqvSAmSwTvm4+VkxxA00hLyTX
         4K8N0UUYGBToJlM+Mm3EL3LYwudreSdgAef1V16lE0dfj7kBABePVxkfCt8QcQ+5B95O
         bgZuWKtj4p1kDdZjgpPtqk5H60lB88NYtf1w0DlBi/g3zAzBik7970gbXLba3vBhB0OS
         2K4X5AKnk00N07Lt6U/8h3o7sGb5m7DY2B6kxLj/85tovUlpwKP5Oms8vc34ewJ8KcK9
         0TAvwyOZiSS9GhsTgFRRCvztJWqj+awa49qWNpVCOjK2Q5JZdMczhSthOh7d/ry1W66R
         9XlA==
X-Gm-Message-State: AOJu0YwSv6VULAtYQi3WB1LlwcWb4+bjG3/IjW8k6wNKlvXkpgSxVsji
	eOBh2kvqXEGPmq13iJXhwxAQx1SV4tQ=
X-Google-Smtp-Source: AGHT+IEBfvSRHnqgnE9fKrdfP2e064b06EXPO0wfS8+MrpP9vX1HNlA898i1TT0tgMr1PpybIT4/siTf2gk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ca0c:0:b0:56c:e0c5:de88 with SMTP id
 p12-20020a81ca0c000000b0056ce0c5de88mr21466ywi.1.1691189265819; Fri, 04 Aug
 2023 15:47:45 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:47:43 -0700
In-Reply-To: <20230704075054.3344915-1-stevensd@google.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com>
Message-ID: <ZM2AD26Mp31tHuH9@google.com>
Subject: Re: [PATCH v7 0/8] KVM: allow mapping non-refcounted pages
From: Sean Christopherson <seanjc@google.com>
To: David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> This patch series adds support for mapping VM_IO and VM_PFNMAP memory
> that is backed by struct pages that aren't currently being refcounted
> (e.g. tail pages of non-compound higher order allocations) into the
> guest.

Aplogies for the slow review, I'm done with feedback for this version.

FWIW, it's probably too bit late to catch 6.6, especially since we need acks from
ARM and PPC, but 6.7 should be very doable unless someone outright objects.

Thanks for being persistent!
