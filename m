Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C54DA510
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 23:11:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ7016JVjz3bSn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 09:10:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XdK9QqRh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XdK9QqRh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XdK9QqRh; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XdK9QqRh; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ6zK2p5pz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 09:10:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647382217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/6a/mKTowgCRvBfrgs/YRVGEpshIsA2z9+KJS3pd3w=;
 b=XdK9QqRh5vgTM8FLwIYhv8F92eMJKuxppuVYemESSK0vljqoMl4C/0cTmQKq6e/CauCbQ3
 FSs9RBDf7+JxsYP7/5lI5sSVdO71LSLulkFvz3sV4ADhuMXxNohIGV7tpPfBUObl8HOW8Z
 nbtVqdT/U66ftwjVaZ94rCRH7WO3nfc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647382217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P/6a/mKTowgCRvBfrgs/YRVGEpshIsA2z9+KJS3pd3w=;
 b=XdK9QqRh5vgTM8FLwIYhv8F92eMJKuxppuVYemESSK0vljqoMl4C/0cTmQKq6e/CauCbQ3
 FSs9RBDf7+JxsYP7/5lI5sSVdO71LSLulkFvz3sV4ADhuMXxNohIGV7tpPfBUObl8HOW8Z
 nbtVqdT/U66ftwjVaZ94rCRH7WO3nfc=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-9vuWyttJP46L0gg5RgqSNw-1; Tue, 15 Mar 2022 18:10:16 -0400
X-MC-Unique: 9vuWyttJP46L0gg5RgqSNw-1
Received: by mail-oi1-f197.google.com with SMTP id
 i13-20020a056808030d00b002da1b96f89dso425595oie.23
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 15:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P/6a/mKTowgCRvBfrgs/YRVGEpshIsA2z9+KJS3pd3w=;
 b=oXf6M2CD6sKaDSXV6OYwyPbTADSNGNzKLjDscfWsdrd38pLFCGCg2wGZXI+PSGl9uH
 AS+HPNU70/ZGzCrUn1Cqhp8oj7+uApYvw5MlZa9QFzjZ0yTT+46P4wX2I7SzPk37xfOd
 wTUiRQLXnthvmEtRC/eCTq1DGBC54qAbl1ZcQfNq9yAnHSZY/5zpkxPL+lsMO5z3BRpe
 U6u2LqdQoYiJ20XDSLFtoM9R6wLhscrZYNQRDnbHmGflDA6q0inhbWG8RsNR61LkDbAr
 v8bKjpAjObQyDQyZ7G+jireab4OMeW1skBj4XQ2ktIXjUQlaQ96cbsSIwt2UubHXrAhn
 JB0A==
X-Gm-Message-State: AOAM533tMewOizLa4HmQvNFITGFbcm/YGDIF8Ao9BYM7islHF6WGFx1V
 okRzQAMkQuzml1skvIJK0HA7xlWDfEaJXCCloKUCRt0Q9cNZ5btaIz4r8Xw5NcqYOCAYk94quGr
 gc0qLkI+837so9NyLA8K28+cz+w==
X-Received: by 2002:a05:6870:41c7:b0:da:df9:2039 with SMTP id
 z7-20020a05687041c700b000da0df92039mr2305863oac.75.1647382215734; 
 Tue, 15 Mar 2022 15:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtCYqhmglEUjSTOJUbxaFZTet3sxYMWypuVBA8zDjPqc0xhj2svC5cpitN0TQ0ycCPbVPeEQ==
X-Received: by 2002:a05:6870:41c7:b0:da:df9:2039 with SMTP id
 z7-20020a05687041c700b000da0df92039mr2305851oac.75.1647382215508; 
 Tue, 15 Mar 2022 15:10:15 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::48])
 by smtp.gmail.com with ESMTPSA id
 ay44-20020a056808302c00b002d9d2b564absm185471oib.43.2022.03.15.15.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:10:14 -0700 (PDT)
Date: Tue, 15 Mar 2022 15:10:11 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/2] static_call: Properly initialise
 DEFINE_STATIC_CALL_RET0()
Message-ID: <20220315221011.aeh67zvgproc4zvq@treble>
References: <1e0a61a88f52a460f62a58ffc2a5f847d1f7d9d8.1647253456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <1e0a61a88f52a460f62a58ffc2a5f847d1f7d9d8.1647253456.git.christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 14, 2022 at 11:27:35AM +0100, Christophe Leroy wrote:
>  #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)	__PPC_SCT(name, "b " #func)
>  #define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__PPC_SCT(name, "blr")
> +#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)	__PPC_SCT(name, "b .+20")

There's a PPC_SCT_RET0 macro for this "20" offset, might as well use a
stringified version of that for robustness/readability.

Otherwise it looks reasonable.

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

