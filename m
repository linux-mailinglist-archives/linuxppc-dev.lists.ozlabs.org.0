Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C931A9DA99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 02:25:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HV4w38D7zDqLD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.microsoft.com
 (client-ip=13.77.154.182; helo=linux.microsoft.com;
 envelope-from=jorhand@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 46HRvq2kWrzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 08:47:00 +1000 (AEST)
Received: from [10.91.6.157] (unknown [167.220.2.157])
 by linux.microsoft.com (Postfix) with ESMTPSA id D15B720B7186;
 Mon, 26 Aug 2019 15:46:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D15B720B7186
Subject: Re: [PATCH v12 00/11] Appended signatures support for IMA appraisal
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linux-integrity@vger.kernel.org
References: <20190628021934.4260-1-bauerman@linux.ibm.com>
From: Jordan Hand <jorhand@linux.microsoft.com>
Message-ID: <9682b5d0-1634-2dd0-2cbb-eb1fa8ba7423@linux.microsoft.com>
Date: Mon, 26 Aug 2019 15:46:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190628021934.4260-1-bauerman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 27 Aug 2019 10:19:41 +1000
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/27/19 7:19 PM, Thiago Jung Bauermann wrote:
> On the OpenPOWER platform, secure boot and trusted boot are being
> implemented using IMA for taking measurements and verifying signatures.
> Since the kernel image on Power servers is an ELF binary, kernels are
> signed using the scripts/sign-file tool and thus use the same signature
> format as signed kernel modules.
> 
> This patch series adds support in IMA for verifying those signatures.
> It adds flexibility to OpenPOWER secure boot, because it allows it to boot
> kernels with the signature appended to them as well as kernels where the
> signature is stored in the IMA extended attribute.

I know this is pretty late, but I just wanted to let you know that I
tested this patch set on x86_64 with QEMU.

That is, I enrolled a key to _ima keyring, signed my kernel and modules
with appended signatures (with scripts/sign-file), set the IMA policy to
appraise and measure my kernel and modules. Also tested kexec appraisal.

You can add my tested-by if you'd like.

-Jordan
