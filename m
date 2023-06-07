Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6387253BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 07:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbc4T1Cj1z3dw7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 15:54:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jFP46XWu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jFP46XWu;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbc3Z652bz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 15:54:00 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d44b198baso194113b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 22:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686117237; x=1688709237;
        h=in-reply-to:references:message-id:content-transfer-encoding:cc:to
         :from:subject:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9p0m2NvKT3cZmqPkFsE+AtBiAL9OCBr7TGAbcichu4=;
        b=jFP46XWufvIf3gr10NWNEJKcizv7NqvEjIahxEMLBXlFmlhzqSyz3zyAG53RSeBqlm
         2HWlj1t9N8SC4Hzl9NY4gHiKBNxTjie4mEzNTFCPT1OT/zPxM1hMiDlY0/ehX8H2R2bw
         fp6k+CPkZxtkoGjcxDdJoSEvMhuOqlc8oDwtzvuXtQhFrHaaDb69sd+wo9AcEXlvHNuZ
         STofx7NwMjuWxUunmyQwPuJGvRM9NGpkf8f7DOLXPj7nzBaBpNGgH39mEfVw07Tz586N
         AO7vTloRO6Q7k/ThcJi0kL3aU+rYv4tN181ygWUUrKJYB08RO8x2odvF0FMjoI0BrtXU
         AZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686117237; x=1688709237;
        h=in-reply-to:references:message-id:content-transfer-encoding:cc:to
         :from:subject:date:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9p0m2NvKT3cZmqPkFsE+AtBiAL9OCBr7TGAbcichu4=;
        b=ljFgHOuXX8VFzLj9inMaFppJJEy4XpGa3i2n8bN+8oR0Qjm8yXvZIZYOtgMMXPwyq0
         jbIJbuoqsJSfEV9BOC7ds/rB3YO2BUrDBYTZcuZ+92nhE4fX1OyW42/RLVOaZhluOIKl
         J10+nJi9AsVvaz3kfnM4M0kLuGyCv1HnE5nAnMfBhxDLf6CBepSfoeC2Tm2zRfgoKLsc
         oqd6vHu8n+k6BmwC/Pc7B5E0Y4cWLyGFOyzUYzylJzxQ31Vc54eDdhX6J/mKASu7GWnQ
         ASHk0dPUiTLO9WvcFkU+iyVx5jnMWC1Y2sbXqpQpvLkJGFNb5qO2cQ+HZ82L3QFl0AKV
         oGEg==
X-Gm-Message-State: AC+VfDzR8mhGkVzLkI47cYeUJ3szn/IfbVn0KjhoGzra3jWqXfld5i5D
	0nWBOwHiu+hNMBAoXgbJZKE=
X-Google-Smtp-Source: ACHHUZ4680Um19V/5LAOXB+CrQ9+yfVd2mnz+GmqeZGDj24KdFC1jM2f7R8fD/rJ1IrDoQR5g8JNxw==
X-Received: by 2002:a05:6a00:189a:b0:652:a559:b2c5 with SMTP id x26-20020a056a00189a00b00652a559b2c5mr6028184pfh.13.1686117236975;
        Tue, 06 Jun 2023 22:53:56 -0700 (PDT)
Received: from localhost ([1.146.33.32])
        by smtp.gmail.com with ESMTPSA id p9-20020a62ab09000000b0063d2d9990ecsm7622983pff.87.2023.06.06.22.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 22:53:56 -0700 (PDT)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jun 2023 15:53:49 +1000
Subject: Re: [RFC PATCH v2 0/6] KVM: PPC: Nested PAPR guests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jpn@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CT6641NE8LNV.20P6CCOLXZEP@wheely>
X-Mailer: aerc 0.14.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
In-Reply-To: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 4:48 PM AEST, Jordan Niethe wrote:
> There is existing support for nested guests on powernv hosts however the
> hcall interface this uses is not support by other PAPR hosts.

I kind of liked it being called nested-HV v1 and v2 APIs as short and
to the point, but I suppose that's ambiguous with version 2 of the v1
API, so papr is okay. What's the old API called in this scheme, then?
"Existing API" is not great after patches go upstream.

And, you've probably explained it pretty well but slightly more of
a background first up could be helpful. E.g.,

  A nested-HV API for PAPR has been developed based on the KVM-specific
  nested-HV API that is upstream in Linux/KVM and QEMU. The PAPR API
  had to break compatibility to accommodate implementation in other
  hypervisors and partitioning firmware.

And key overall differences

  The control flow and interrupt processing between L0, L1, and L2
  in the new PAPR API are conceptually unchanged. Where the old API
  is almost stateless, the PAPR API is stateful, with the L1 registering
  L2 virtual machines and vCPUs with the L0. Supervisor-privileged
  register switching duty is now the responsibility for the L0, which
  holds canonical L2 register state and handles all switching. This
  new register handling motivates the "getters and setters" wrappers
  ...

Thanks,
Nick
