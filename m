Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C818C5FA691
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmWJm5NTvz3dtV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 07:50:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eYQbkdsI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eYQbkdsI;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmWHn0YWVz3cB6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 07:49:38 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id b2so11369005plc.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Km09otb6ysXfp2Upd1R3VIr3s3vlnpHyezTgN6rBo=;
        b=eYQbkdsISYtwea2nFRP6PRE7kZCgNezCR5oRAUagKNHLr/KoqGgYI4laVi+tdN6cey
         7kEyxoAptvek1ldzQNCAky1/7CfQ5KDvAzXvOFQSAvpEp6vAcFtUYVWOH2Q31QG5xe+I
         UmC/dBs2Q0vXHymSnrMP7w9K2ksRD/o5AeE2P57qVKwBSW1YGsnsyhRPRaCI6FoJvg6k
         gb8gTZ/ykAa2hkDk9+8EfMujkzIOg6pHU8rsQaXCYWRcxtOL9P2WXBsHHWj2Bf5pB6C+
         vhrVzUo9Imea40vRu89tz9Vrb/hQevVB55KKJ1u68IDL4SN0/Hfd1sdI25mogz4vYXEs
         pXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9Km09otb6ysXfp2Upd1R3VIr3s3vlnpHyezTgN6rBo=;
        b=VgRLRmXPNjG7tUi20nbGF33yCTns39taBxSaiB7/LWrsBG8dhUj6EjNqmKpH/fE9aT
         DYfkAUhuqhRlhlbKy5cJIRZYV94wtCtj9tqmYM3cBbS+pjPHliA1bur0hhE+frYK0vB+
         e6Wzy9KvvjW11jjKAsWc2AW2iGNTXKys0veGrUJr3Z+361z5fmfZisO2BRS+zGHyrKyC
         iO+gJpNlSaOC9627/50pPLrWdXXRUl4gbj7ALirnCB7CECPMvI4T+ADtpp0Q0hyKLjAj
         UcroDuzgCXU3r9X6NnCdemUl76s+nh+lVBPd53sBaWIG3KEGY5B2J1iQDcpkNlEtizu0
         c5AA==
X-Gm-Message-State: ACrzQf3v8EyOVmEwj+fLUmp95taXuo8aiN4z1Ej9MXg9DwxOIEi+KH6P
	MxfGWuUuwqAkPy/KHKNT8xE=
X-Google-Smtp-Source: AMsMyM5Dgx1NtpzY9x2NDNyrXo4BK0nGyr7EHfFNmmMSe6fMsjlUD1skYA6kp6YIoDUb13w5F4aKug==
X-Received: by 2002:a17:902:d4cb:b0:178:6e81:35b7 with SMTP id o11-20020a170902d4cb00b001786e8135b7mr21519312plg.108.1665434974242;
        Mon, 10 Oct 2022 13:49:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k18-20020a170902c41200b0016c0c82e85csm6085039plk.75.2022.10.10.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 13:49:33 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:49:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] powerpc/pseries: Move dtl scanning and steal time
 accounting to pseries platform
Message-ID: <20221010204929.GA2987565@roeck-us.net>
References: <20220902085316.2071519-1-npiggin@gmail.com>
 <20220902085316.2071519-5-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902085316.2071519-5-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 06:53:16PM +1000, Nicholas Piggin wrote:
> dtl is the PAPR Dispatch Trace Log, which is entirely a pseries feature.
> The pseries platform alrady has a file dealing with the dtl, so move
> scanning for stolen time accounting there from kernel/time.c.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

This patch ties DTL to PPC_SPLPAR without updating configuration
dependencies. As result, the following build error may now be seen
if CONFIG_PPC_SPLPAR=y and CONFIG_DTL=n.

arch/powerpc/kernel/irq.o: in function `.do_IRQ':
irq.c:(.text+0x2798): undefined reference to `.pseries_accumulate_stolen_time'

I updated my own configurations to avoid the problem, but you might see
randconfig failures with this error in the future.

Guenter
