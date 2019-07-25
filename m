Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63375ADF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 00:47:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vnR20NvJzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 08:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intelight-its.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=doug.crawford@intelight-its.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=intelight-its.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intelight-its.com header.i=@intelight-its.com
 header.b="WH1079h/"; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vn4J03bhzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 08:31:06 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id o13so23710348pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 15:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intelight-its.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=tPX0XHT5eT1ob+jLsr6HuCNHQKWDSMlwub/YxQ/fuOY=;
 b=WH1079h/UBE6hFOrDh7Z/1PTVIebom96Cagib6kuQDBfX5HAi1IT8vco+yGDCBGvzH
 rH7+TB7hIi+4hMe6kmUhhZEBXg1Cg/OIbra12uiIPGa/KI07zCHkOZf8D5RjjPPe2ysJ
 PIa3vDbslrIUFPq5K1WmkuHB3Gq/xSDIy87ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tPX0XHT5eT1ob+jLsr6HuCNHQKWDSMlwub/YxQ/fuOY=;
 b=DPUvZdH7UmVPg7Q1gWC/Kfnd8U+ILGun7LJvUEJKvkOBNwHA1s5sULnDlWjY3FtKzn
 HO6aLiHzzrBMP6oIpQNmqENfErM0KUZsUx2CdSyBqaHHzljXD3ZQaWpseedIhhACdW89
 ZCjnBL9p4QgNZkFsQfXUqVNRQzRYqQlvcn01kTHs8PRuYKtoA7vqTpdgXVZYnYbTJT4b
 cm5+wSa+nPMuXU01E52fd9j0nDM2YrURu+kv1g8oYSSK10vrkq0qvRpZjJTHOesakOEt
 yrC2Wck2IlRexZ8h/AXaSZbU8AElnDxnm6O96IC9Q5kIbJgi1bW57cRlpjQqtpalE7B2
 Rv4A==
X-Gm-Message-State: APjAAAWu9P/3zxcJmgQJW5XtjcD3VJ/topSRcjCPysTOqyOZRKeuPNyK
 YAGbjnorCZmlxLlVeaJEw8ybb2UD3GEa2YpXF0g1RcumCeU=
X-Google-Smtp-Source: APXvYqyrgueVZbH7a1PwXiM7R7DXpQurZiQENJBbGNST8k/L5+UXUq4CI2WoCEfH1jKb05UAE+xn5U4L0gl1w6XwBl8=
X-Received: by 2002:a17:90a:9bca:: with SMTP id
 b10mr94690940pjw.90.1564093863355; 
 Thu, 25 Jul 2019 15:31:03 -0700 (PDT)
MIME-Version: 1.0
From: Doug Crawford <doug.crawford@intelight-its.com>
Date: Thu, 25 Jul 2019 15:30:26 -0700
Message-ID: <CAESxVDiyXu+=6+YmLej3K=i55h3=Z9JLA8JgrDn3fEQGUuSq7Q@mail.gmail.com>
Subject: Freeze on ppc32 MPC8248 board with 5.2 kernel
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001efbbd058e88fb4f"
X-Mailman-Approved-At: Fri, 26 Jul 2019 08:45:56 +1000
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000001efbbd058e88fb4f
Content-Type: text/plain; charset="UTF-8"

We have a ppc32 MPC8248 board that is working perfectly with the 4.19
kernel.
We have noticed two issues with the 5.2 kernel:

1) If the new CONFIG_PPC_KUAP (kernel userspace access protection) is
enabled the kernel freezes right after initializing all the drivers and
just before starting /sbin/init.

2) If CONFIG_PPC_KUAP is disabled the system starts up, but any user space
program will hang indefinitely after calling the GCC atomic
"__sync_bool_compare_and_swap".  This happens when nginx starts.  The same
nginx binary works fine on a 4.19 kernel.

--0000000000001efbbd058e88fb4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We have a ppc32 MPC8248 board that is working perfectly wi=
th the 4.19 kernel.<div>We have noticed two issues with the 5.2 kernel:<div=
><br></div><div>1) If the new CONFIG_PPC_KUAP (kernel userspace access prot=
ection) is enabled the kernel freezes right after initializing all the driv=
ers and just before starting /sbin/init.</div></div><div><br></div><div>2) =
If CONFIG_PPC_KUAP is disabled the system starts up, but any user space pro=
gram will hang indefinitely after calling the GCC atomic &quot;__sync_bool_=
compare_and_swap&quot;.=C2=A0 This happens when nginx starts.=C2=A0 The sam=
e nginx binary works fine on a 4.19 kernel.</div></div>

--0000000000001efbbd058e88fb4f--
