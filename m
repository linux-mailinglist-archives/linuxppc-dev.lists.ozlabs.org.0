Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960019F86B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 17:00:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wtyP26jdzDrJv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 01:00:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=NhKTH29b; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wtt759KBzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 00:57:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586184997;
 bh=pLz/LsV8AU7v9pBmvODpUyRCAG40qhdMJASvG8MdKkU=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=NhKTH29bFE5BlYXxaLeBn5Un/TS/KxgTmjuI9VdyDe1NH3k9x/UrITM5JOze7p0xg
 6hHZq9CHYlIl1x04TQEImENysqugOJQdtLfukdYTIjM5ndMV6aPVrfvHzHlkjkcG63
 rkjaYCPf65NJ4YmsDqU9isOsdtOj0E1v1tnONcDE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.243.176.200]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ls8xf-1jArIw0DRn-013sl9; Mon, 06
 Apr 2020 16:56:37 +0200
Subject: Re: [PATCH v5 1/2] powerpc/powernv: Return directly after a failed
 of_property_read_u64_array() in opal_add_one_export()
To: Qiujun Huang <hqjagain@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406125242.4973-1-hqjagain@gmail.com>
 <20200406125242.4973-2-hqjagain@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5b8b22bb-8236-1c88-5335-a0444aed79a4@web.de>
Date: Mon, 6 Apr 2020 16:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406125242.4973-2-hqjagain@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N3FYNfKmLhG/CmC/EVv3z0v4cgCRnS1WJQFabLg9w3V2As5N5hg
 J/5R7MJvUZlfBmtFO2dHuU+ooMxvZ1T3I6QMS9xbIU1TMDHntv6cZHLhxBlL9vKA2WW475Q
 5WpmD49659wtFs6EMk1fJhi2j5gzVODKniXfJHXQJk5PS9Ena4sk7ILABNxpVjU4glsL0OQ
 B5pcLvhusvxAXLh7MOXbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7ERyUtTMWEA=:q5+TEOX/2iYRwb2O9m5gog
 clwVow4sq48csyHfjoohXPTn6AEkIECWL85NsVZlz+lCiYNox+k244N13Ih5Kahib6CLTr3uV
 sxAJGVmnc+xdiYzzS3GNcCV6w15iIZsVOsBUpU1O6JBz3MLanUtKuXcIydyP8MFrVSDRxLxhs
 YcBL8zCscdrOJIs7XMniZoTgOaBR+Ch/CATjefwFT2INO+1V9n2wtsVM5ffM2L4EWJsanjqLJ
 PAqEMzxr75+Oen+TTdoR0EjtgWdhT4poXyGLliEsdJhORbTWaTizZK+bqhrb7Oaix0fzZ+ykV
 o9OKZdZn6TQqoZLRr8uHnO1BqCWeIdKq20gJmCdmLeD1HiM+vGH+YQYbQ+SdpW8BUaPTYUNtI
 jWeMo64dOPvcMJKVOBlG+/xOIQ0tqNdTmg/Epyz5TalFjMSijrWHr2DUWSt35bS4mMFCV+SXf
 6ALJdXN8xplgaRaa7Qr2TgKUNBxozNDkWf3dNzw/xKs7eIhJwio67Y1Fu42N2GklF1SwOCWvs
 uiftl2sJqD5L8E7+YP65kYuW4KYvDPv+dHZgYnnuB5Tkfh34WgOsZ6RqCi5M4KutWlfyNnFlb
 eYH5tjEw+IT45rNxwVS9cZrEb5X/iZFr6UVoyAxBq7R7kujqNJ6iInSyN0H+pGm+Eg9z50PnR
 yeAck0UdYWd+EcydBClUZO1wMOK7+y4DOPunM+cThFSNa5voa9JDYZWQj2+XHTGsJyZfjLnqb
 SBPlaCykC/m9PJFtKyIM1tNgXNedxwCVTpopEbuPUn1j0oxyp/GI3KSRG6EkWkaibd7g7LXJj
 DWKhOaY6t0ZuwKlxzSNnDkm4ZgacweZY3sGlh2TCLtjl1t9ppyRG5Kl+tppy0OAtUVsh/y4A6
 JwNt0OcXMAqWZpyF/m8bWIjPOCHQBr9/yYsilz5dezlQ8IIhvIUnjAmCdUU/Rv/WxqaYoUqjP
 p5NYwJrwCgCGFQgmMx5nWMq/ZGEow853efiJz0nU+sGDvEHjjnlBPvoYTpjTyyZR71s2ZsKUr
 YT0O4t3d/JMlyoT4H5MQt9NSugkK52hkPnoXi+qv1R8C0z5X56HkC/Wrg1DqwQl2n61llnT+k
 M1yO9IWdTlasK24rX7u20YeFVA1Tyx+nJPBJN58nTi4T4qP0cfAfib4gT6WachXYGTYzJ0ppL
 tDIC5Hb8DK7Co+CkkXfCn+RNek1RWobUnyDfT0dTu+BE+5CIu6MeG1ar6+UQlecPngyu8rBn8
 S+FuPdXrMSZfTExz6
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
Cc: linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> We don't need to go to the labal of out =E2=80=A6

Please avoid a typo for this change description.


> fails, as there is nothing to do. Just return.

I suggest to reconsider also this wording.

  Return directly after a call of the function =E2=80=9Cof_property_read_u=
64_array=E2=80=9D
  failed at the beginning.


> And we can =E2=80=A6

Do such words indicate that even this patch approach should be split
into further update steps?

Regards,
Markus
