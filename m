Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D4204D3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 11:00:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rgGn2NPgzDqT9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 19:00:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=LC/Prwk8; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rg9l4111zDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:56:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592902554;
 bh=3yqnrGafGbJ0tXimLwFGtJ2yGSF0QBxzZ4+10OuTalM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=LC/Prwk8dbjEgxsm4IJZ9fqItzwKqZvDN35ht5TbW2gRt6V8ChJPwfXtGOul8CBgg
 fK3INnhbbZdqoII6Jk3Z1RJXXaw0kMb+9eqefHB07XyEeXClplSJpeowXwrpLhWt7q
 vevtIFbVcz2TdubuK6hdiSwRfWTCU9lKzruJ+DX0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.105.198]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lx73h-1ilRBb1EBV-016k8C; Tue, 23
 Jun 2020 10:55:54 +0200
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
To: Shengjiu Wang <shengjiu.wang@gmail.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
 <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
Date: Tue, 23 Jun 2020 10:55:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:/wu01VqnpeuiFKn6xE+qbTqm1uXYF9D06eNXdPHGH89BpcHzLjX
 wrmopcETctrwEaIvACOqKCnGgB9drTAGMcPLhyMw0zaJZSkM8dyGJxpH16Z/L9fu+vsQJFf
 r02r+mZTgngPx8K66LqVAD0EedxidxAjNk57VcWL2wJaz6ezZdpYqVNaRCGrgi7KA15RibC
 IYcG6WZ5vV0f/r1rplPUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y9JLtKPGUEo=:WfCSFhleUjpYZXkOnTO02/
 t8edL5u2/HmrmOd5AkpLG48iDISWPtH4HNvhZApy1HqEbfe7K/WWzsdtatcho4icc26P7ZOvO
 Rc/Q1rxmSV8aN5F0poCN4ZLh56C4ZYCaX84nVeZg6EcQKT0y/4OPappdrF30G0Sw/tsHobbT0
 Tkn/ULdAdFfpgbzr9ebLuPh3fxb7zOz4Z/J0tEPKzIrwghnLzfRoOgvyI+csYCZfjXKGEEmrv
 4qId+ZFkkCZXm4Jy12/g+GdN/nAnKxIPQpVS+bLwovepas4zVz6SFbeOneHsq5zUKl9p/5zHQ
 DrmMvO6z7kZT9c3RAbnpC0K1ZyImLlDL54R19Rsmbo7nJZ8Y+AcR2qUqHvKKxI/Coit8ukilx
 QvtoeLSqPqFJecOys48hkGVaIcoH4h9XmEFGdW/RJmGJ3RG3M+pDxuaZ3rjSk4JaJm6Nc/Ri7
 5PsmC5ijz8foPMIIz6NehqssecK69I+ZRMQ/prXldLWvNJr8YHUMTMpAt2misYcLx5gTlA/Gm
 /wFsqywt1tmaLIYvMLQa0Mm2v1MSBw6s8MzDLqfpHibNM6Nc3Z5/f1IuAeLw+TTUCKrGx05Ru
 rDUEQc/oAEV736aLlkcEeNGEBkVdVEn9ky9RN371k5TJr3GxAjf5lCyfAnofoGONt22/41yKy
 f7WgLSiEhmjKgZpjedXKBd0E1vaWk/Nh8qztyWranmjZqw1/1rnyJoS3Usv1QgFbKjMGBycT+
 +BnNjhBS7DjonHMpEghqO+w0Nsn7GLK1kJkZIcbN+grOF9yJqxMIE3q59HKssaU8x57wcMBbj
 RHwPvv8dvthEsB1RxKKCOwLaeeZbl4jBPP39Pzz3ZOYvhW0foOwMzLQ/Vax7wfsdO5oO/x6JU
 QHtQwpLl/+WErzParkTXcanbyjLyHeLENhYv3DoJs6GNvhp7m7zBCsvq7E0kPd8InTxmyigxl
 7Z3H8/2rGhsNUkX6DPCyCd5ChrBSDmzvSVb4HHnRvG1T63opwNO8K3RzLgtcbAl7pIWAMm7/J
 ah5h6ykrzMvVAXqzMzX1SC0sBKmOhkrzqXB8EBnjgh88MxHltUjxim3/kKfRNNlO0+dkp7XEx
 uF1nbaJyKAVnQRkVso9wvFn6pWnhc6mdVaB97i0/nR7CI76/5fhL84h2rU3YN0Mrwzr9r80ay
 7BBr2N5wDVqjZ85e0dF8pVJwrjIm7Q59ipMuWgBd6gSYkRNXyE6DmZTxNe6aOJZXUjBTklYa7
 UFk1xIm5y87O4J3cX
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
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>     clk_prepare_enable and clk_disable_unprepare check the input
>     clock parameter in the beginning of the function,

These functions call further functions which perform null pointer checks.


>                                                       if the parameter
>     is NULL, clk_prepare_enable and clk_disable_unprepare will
>     return immediately.

The interpretation of these function implementations seems to be reasonable.
Would you like to achieve any improvements for the corresponding software documentation?


>     So Don't need to check input clock parameters before calling clk API.

What do you find imperative in this wording?

Another wording alternative:
   Thus omit extra null pointer checks before four function calls.

Regards,
Markus
