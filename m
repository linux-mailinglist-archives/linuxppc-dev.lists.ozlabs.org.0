Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A89D39FF06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 12:00:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JLnq0j2RzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:59:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="go/KEl1g"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JLjP3cwSzDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:56:09 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id m3so1166514pgv.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=gtLw2PD4vdmVI8TU44xrSxSJ1jQdArNsk+f5nXQyUHY=;
 b=go/KEl1geboy4c2V5Cp8XN/QsY82eAeesBzguIwJYhAw4muPV1Brgy5C0xfgun+ELg
 UWLOBgp6lVGbafMMH7hQDx2U1/eNHDQhxx5IW4key7x65bK2qdmZo/8QY+48kNzCk+St
 tkOAWyi0HlAzV4eV936GCe4Ml5q/EIJqL8JDAN+sKdKsn8TWBAlXA3WnrhG9ElXtkwSx
 jwHhf0q2QYh3i2cy5/+9GJ8UhLJmEtqjx2TUPqCEmfMT5YeZ4/TwzG40jPEpBrF959XO
 lU22MP1hrJ0q/nS+vRnGyPancQ5p8++uMLaJEfZ7u+TyxSHcPsUYHGZWGbjk73TUQjRD
 FRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=gtLw2PD4vdmVI8TU44xrSxSJ1jQdArNsk+f5nXQyUHY=;
 b=Uxc5vaGVsn9t8+Z8PeTBCBr4ZETycHcRJgCQeJgC9iCS539SadxM8RydMpDc6I7awV
 xlLWXlbDMp3h7sauQlWxYpVqY3+P09osxCaG9g6U1YIaTNXft8VHhnYHUS97ZJqDd9pi
 qxVdLB98SE+oUITxnPd8rfVB37YCHDtoANqlvaw3UnwX5x81ZGGLsu+32AARUvf6Eg6+
 HbUP8HyGQOE8bOLU28I/NY/3gc3yXfJNI54ooMoYYRQCWkoKWCXj5WI07myRZrZq0ACi
 fXB0O89OvUyGfoiIAWyQYqPxYyALGkWiNcsPTuttT1ANIqHfuK6or1qqr2LCQn21GRpb
 qSoQ==
X-Gm-Message-State: APjAAAW1ARX7stJhMTHb6xi3Svx4SCjOt6XZYy89nP8nB3M2SJ2JJ70v
 hOW0rT/d9E5Qvl+4qiAhSLthWLcL
X-Google-Smtp-Source: APXvYqy+022yXMXjRoNYay9Eddr6hIUiGUKFmMvrwAjs2j3EAMYn1nKDVHKODu1ZNNheAKFJtXSlRg==
X-Received: by 2002:a63:460d:: with SMTP id t13mr2611381pga.205.1566986165793; 
 Wed, 28 Aug 2019 02:56:05 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id a10sm4445051pfl.159.2019.08.28.02.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:56:05 -0700 (PDT)
Date: Wed, 28 Aug 2019 19:54:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [DOC][PATCH v2] powerpc: Provide initial documentation for PAPR
 hcalls
To: linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20190828082729.16695-1-vaibhav@linux.ibm.com>
In-Reply-To: <20190828082729.16695-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566986020.cw3ahh8v0v.astroid@bobo.none>
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, msuchanek@suse.de,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain's on August 28, 2019 6:27 pm:
> This doc patch provides an initial description of the hcall op-codes
> that are used by Linux kernel running as a guest (LPAR) on top of
> PowerVM or any other sPAPR compliant hyper-visor (e.g qemu).
>=20
> Apart from documenting the hcalls the doc-patch also provides a
> rudimentary overview of how hcall ABI, how they are issued with the
> Linux kernel and how information/control flows between the guest and
> hypervisor.
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
>=20
> v2:
> * Added a section on Register conventions to be followed when invoking
>   hcalls. [Nick]
> * Updated section on HCALL ABI to clarify that byte ordering only
>   matters to in/out values passed by a memory buffer. [Laurent]
> * Updated a code comment in 'exceptions-64s.S' describing hypercall
>   register conventions to point it to 'papr_hcalls.rst' [Nick]

Thanks for that!

Acked-by: Nicholas Piggin <npiggin@gmail.com>

=
